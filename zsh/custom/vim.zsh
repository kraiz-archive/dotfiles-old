compile-vim() {
    sudo aptitude install python-dev python3-dev libluajit-5.1-dev libperl-dev
    cd /tmp
    git clone --depth=1 https://github.com/vim/vim.git
    cd vim
    ./configure --enable-fail-if-missing \
                --with-features=huge \
                --enable-multibyte \
                --enable-perlinterp \
                --enable-luainterp \
                --with-luajit \
                --enable-pythoninterp=dynamic --with-python-config-dir=`echo /usr/lib/python2*/config-*` \
                --enable-python3interp=dynamic --with-python3-config-dir=`echo /usr/lib/python3*/config-*` \
                --prefix=$HOME/.local && \
    make && make install
    cd $HOME
    rm -rf /tmp/vim
    $HOME/.local/bin/vim --version
}
