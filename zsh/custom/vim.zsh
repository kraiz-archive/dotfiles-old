compile-vim() {
    cd /tmp
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --enable-fail-if-missing \
                --with-features=huge \
                --enable-multibyte \
                --enable-perlinterp \
                --enable-luainterp \
                --enable-pythoninterp --with-python-config-dir=`echo /usr/lib/python2*/config-*` \
                --enable-python3interp --with-python3-config-dir=`echo /usr/lib/python3*/config-*` \
                --prefix=$HOME/.local && \
    make && make install
    rm -rf /tmp/vim
    $HOME/.local/bin/vim --version
}
