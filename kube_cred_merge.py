#! /usr/bin/env python

from optparse import OptionParser
import codecs
import os
import shutil
import sys
import yaml


def read_yaml(filename):
    with open(filename) as fp:
        return(yaml.safe_load(fp))

def write_yaml(filename, yaml_data):
    with codecs.open(filename, 'w', 'utf-8') as fp:
        yaml.safe_dump(yaml_data, fp, encoding='utf-8', allow_unicode=True)

# コマンドオプション定義
parser = OptionParser()
parser.add_option("-f", "--file", dest="filename",
        help="credential yaml file to be imported")
parser.add_option("-i", "--inplace", dest="is_inplace",
        default=False, action="store_true",
        help="output will be overwritten to ~/.kube/config")
parser.add_option("-n", "--name", dest="cluster_name",
        help="rename cluster name")
parser.add_option("-b", "--backup", dest="create_backup",
        default=False, action="store_false",
        help="create backup file of original config file")

(options, args) = parser.parse_args()

# 引数チェック
if options.filename is None:
    print("インポートする credential ファイルを指定してください")
    sys.exit(1)

if not os.path.exists(options.filename):
    print("{} が存在しません".format(options.filename))
    sys.exit(1)

# ~/.kube/config 読み込み
config_file = os.path.expanduser("~/.kube/config")
if os.path.exists(config_file):
    # バックアップを作成する
    shutil.copyfile(config_file, config_file + ".orig")

    # credential 情報を読み込む
    cred = read_yaml(config_file)
    cred_append = read_yaml(options.filename)

    if options.cluster_name:
        # クラスタ名を置き換える
        cred_append['clusters'][0]['name'] = options.cluster_name
        cred_append['contexts'][0]['context']['cluster'] = options.cluster_name
        cred_append['contexts'][0]['name'] = options.cluster_name

    # cred_append を cred に append する
    for key in ['clusters', 'contexts', 'users']:
        cred[key].append(cred_append[key][0])

    # 出力する
    if options.is_inplace:
        write_yaml(config_file, cred)
    else:
        print(cred)
else:
    cred = read_yaml(options.filename)
    if options.is_inplace:
        write_yaml(config_file, cred)
    else:
        print(cred)