#!/bin/bash

erlang_version=$(erl -eval 'erlang:display(erlang:system_info(system_version)), halt().' -noshell | sed -e 's@"@@g' | sed -e 's@\\n@@g')
echo "$erlang_version"
