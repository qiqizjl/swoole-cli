SRC=/Users/sean/Documents/php-work/swoole-cli-4.x/php-src
ROOT=$(pwd)
export CC=clang
export CXX=clang++
export LD=ld.lld
export PKG_CONFIG_PATH=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libyaml/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/curl/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/imagemagick/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libwebp/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/freetype/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/lib64/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libpng/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/gmp/lib/pkgconfig:/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl/lib/pkgconfig:$PKG_CONFIG_PATH
export ICU_CFLAGS=$(pkg-config --cflags icu-uc)
export ICU_LIBS=$(pkg-config --libs icu-uc)
export ONIG_CFLAGS=$(pkg-config --cflags oniguruma)
export ONIG_LIBS=$(pkg-config --libs oniguruma)
export LIBZIP_CFLAGS=$(pkg-config --cflags libzip)
export LIBZIP_LIBS=$(pkg-config --libs libzip)
export LIBSODIUM_CFLAGS=$(pkg-config --cflags libsodium)
export LIBSODIUM_LIBS=$(pkg-config --libs libsodium)
OPTIONS="--disable-all \
--with-curl \
--with-iconv=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libiconv \
--with-bz2=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/bzip2 \
--enable-bcmath \
--enable-pcntl \
--enable-filter \
--enable-session \
--enable-tokenizer \
--enable-mbstring \
--enable-ctype \
--with-zlib \
--with-zip \
--enable-posix \
--enable-sockets \
--enable-pdo \
--with-sqlite3 \
--enable-phar \
--enable-mysqlnd \
--with-mysqli \
--enable-intl \
--enable-fileinfo \
--with-pdo_mysql \
--with-pdo-sqlite \
--enable-soap \
--with-xsl \
--with-gmp=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/gmp \
--enable-exif \
--with-sodium \
--enable-json \
--with-openssl=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl --with-openssl-dir=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl --enable-openssl \
--enable-xml --enable-simplexml --enable-xmlreader --enable-xmlwriter --enable-dom --with-libxml \
--enable-gd --with-jpeg=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --with-freetype=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr \
--enable-redis --enable-redis-json \
--enable-swoole --enable-http2 --enable-sockets --enable-mysqlnd --enable-swoole-json --enable-swoole-curl --enable-cares \
--with-yaml=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libyaml \
--enable-grpc \
"
#--enable-grpc= \
#--with-imagick=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/imagemagick \


make_openssl() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build openssl"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/openssl && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/openssl -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/openssl-1.1.1p.tar.gz  && \
    cd openssl && \
    echo  "./config no-shared --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl"
        ./config no-shared --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_openssl() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean openssl"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/openssl && make clean
    cd -
}

make_libiconv() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libiconv"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libiconv && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libiconv -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libiconv-1.16.tar.gz  && \
    cd libiconv && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libiconv enable_static=yes enable_shared=no"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libiconv enable_static=yes enable_shared=no && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libiconv() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libiconv"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libiconv && make clean
    cd -
}

make_libxml2() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libxml2"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libxml2 && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libxml2 -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libxml2-v2.9.10.tar.gz  && \
    cd libxml2 && \
    echo  "./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --with-iconv=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libiconv --enable-static=yes --enable-shared=no"
        ./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --with-iconv=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libiconv --enable-static=yes --enable-shared=no && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libxml2() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libxml2"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libxml2 && make clean
    cd -
}

make_libxslt() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libxslt"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libxslt && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libxslt -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libxslt-v1.1.34.tar.gz  && \
    cd libxslt && \
    echo  "./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static=yes --enable-shared=no"
        ./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static=yes --enable-shared=no && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libxslt() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libxslt"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libxslt && make clean
    cd -
}

make_gmp() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build gmp"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/gmp && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/gmp -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/gmp-6.2.1.tar.lz  && \
    cd gmp && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/gmp --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/gmp --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_gmp() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean gmp"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/gmp && make clean
    cd -
}

make_giflib() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build giflib"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/giflib && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/giflib -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/giflib-5.2.1.tar.gz  && \
    cd giflib && \
    echo  "patch -p0 < /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/giflib.patch"
        patch -p0 < /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/giflib.patch && \
        make -j 8  libgif.a  && \
    make install PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr && \
    cd -
}

clean_giflib() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean giflib"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/giflib && make clean
    cd -
}

make_libpng() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libpng"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libpng && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libpng -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libpng-1.6.37.tar.gz  && \
    cd libpng && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libpng --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libpng --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libpng() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libpng"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libpng && make clean
    cd -
}

make_libjpeg() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libjpeg"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libjpeg && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libjpeg -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libjpeg-turbo-2.1.2.tar.gz  && \
    cd libjpeg && \
    echo  "cmake -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr ."
        cmake -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr . && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libjpeg() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libjpeg"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libjpeg && make clean
    cd -
}

make_freetype() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build freetype"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/freetype && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/freetype -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/freetype-2.10.4.tar.gz  && \
    cd freetype && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/freetype --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/freetype --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_freetype() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean freetype"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/freetype && make clean
    cd -
}

make_libwebp() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libwebp"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libwebp && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libwebp -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libwebp-1.2.1.tar.gz  && \
    cd libwebp && \
    echo  "./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libwebp --enable-static --disable-shared"
        ./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libwebp --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libwebp() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libwebp"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libwebp && make clean
    cd -
}

make_sqlite3() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build sqlite3"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/sqlite3 && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/sqlite3 -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/sqlite-autoconf-3370000.tar.gz  && \
    cd sqlite3 && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_sqlite3() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean sqlite3"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/sqlite3 && make clean
    cd -
}

make_zlib() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build zlib"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/zlib && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/zlib -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/zlib-1.2.11.tar.gz  && \
    cd zlib && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --static"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --static && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_zlib() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean zlib"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/zlib && make clean
    cd -
}

make_bzip2() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build bzip2"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/bzip2 && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/bzip2 -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/bzip2-1.0.8.tar.gz  && \
    cd bzip2 && \
    echo  ""
        make -j 8  PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/bzip2 && \
    make install PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/bzip2 && \
    cd -
}

clean_bzip2() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean bzip2"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/bzip2 && make clean
    cd -
}

make_icu() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build icu"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/icu && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/icu -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/icu4c-60_3-src.tgz  && \
    cd icu && \
    echo  "source/runConfigureICU Linux --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared"
        source/runConfigureICU Linux --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_icu() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean icu"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/icu && make clean
    cd -
}

make_oniguruma() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build oniguruma"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/oniguruma && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/oniguruma -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/oniguruma-6.9.7.tar.gz  && \
    cd oniguruma && \
    echo  "./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared"
        ./autogen.sh && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_oniguruma() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean oniguruma"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/oniguruma && make clean
    cd -
}

make_zip() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build zip"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/zip && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/zip -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libzip-1.8.0.tar.gz  && \
    cd zip && \
    echo  "cmake . -DBUILD_SHARED_LIBS=OFF -DOPENSSL_USE_STATIC_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr"
        cmake . -DBUILD_SHARED_LIBS=OFF -DOPENSSL_USE_STATIC_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_zip() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean zip"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/zip && make clean
    cd -
}

make_cares() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build cares"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/cares && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/cares -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/c-ares-1.18.1.tar.gz  && \
    cd cares && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_cares() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean cares"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/cares && make clean
    cd -
}

make_imagemagick() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build imagemagick"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/imagemagick && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/imagemagick -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/7.1.0-19.tar.gz  && \
    cd imagemagick && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/imagemagick --with-zip=no --enable-static --disable-shared  --with-fontconfig=no --with-heic=no --with-lcms=no --with-lqr=no --with-openexr=no --with-openjp2=no --with-pango=no --with-raw=no --with-tiff=no"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/imagemagick --with-zip=no --enable-static --disable-shared  --with-fontconfig=no --with-heic=no --with-lcms=no --with-lqr=no --with-openexr=no --with-openjp2=no --with-pango=no --with-raw=no --with-tiff=no && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_imagemagick() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean imagemagick"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/imagemagick && make clean
    cd -
}

make_curl() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build curl"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/curl && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/curl -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/curl-7.80.0.tar.gz  && \
    cd curl && \
    echo  "autoreconf -fi && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/curl --enable-static --disable-shared --with-openssl=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl --without-librtmp --without-brotli --without-libidn2 --disable-ldap --disable-rtsp --without-zstd --without-nghttp2 --without-nghttp3"
        autoreconf -fi && ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/curl --enable-static --disable-shared --with-openssl=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl --without-librtmp --without-brotli --without-libidn2 --disable-ldap --disable-rtsp --without-zstd --without-nghttp2 --without-nghttp3 && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_curl() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean curl"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/curl && make clean
    cd -
}

make_libsodium() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libsodium"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libsodium && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libsodium -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/libsodium-1.0.18.tar.gz  && \
    cd libsodium && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libsodium() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libsodium"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libsodium && make clean
    cd -
}

make_libyaml() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "build libyaml"
    mkdir -p /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libyaml && \
    tar --strip-components=1 -C /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libyaml -xf /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/pool/lib/yaml-0.2.5.tar.gz  && \
    cd libyaml && \
    echo  "./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libyaml --enable-static --disable-shared"
        ./configure --prefix=/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libyaml --enable-static --disable-shared && \
        make -j 8   && \
    make install  && \
    cd -
}

clean_libyaml() {
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty
    echo "clean libyaml"
    cd /Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/thirdparty/libyaml && make clean
    cd -
}


make_all_library() {
    make_openssl && echo "[SUCCESS] make openssl"
    make_libiconv && echo "[SUCCESS] make libiconv"
    make_libxml2 && echo "[SUCCESS] make libxml2"
    make_libxslt && echo "[SUCCESS] make libxslt"
    make_gmp && echo "[SUCCESS] make gmp"
    make_giflib && echo "[SUCCESS] make giflib"
    make_libpng && echo "[SUCCESS] make libpng"
    make_libjpeg && echo "[SUCCESS] make libjpeg"
    make_freetype && echo "[SUCCESS] make freetype"
    make_libwebp && echo "[SUCCESS] make libwebp"
    make_sqlite3 && echo "[SUCCESS] make sqlite3"
    make_zlib && echo "[SUCCESS] make zlib"
    make_bzip2 && echo "[SUCCESS] make bzip2"
    make_icu && echo "[SUCCESS] make icu"
    make_oniguruma && echo "[SUCCESS] make oniguruma"
    make_zip && echo "[SUCCESS] make zip"
    make_cares && echo "[SUCCESS] make cares"
    make_imagemagick && echo "[SUCCESS] make imagemagick"
    make_curl && echo "[SUCCESS] make curl"
    make_libsodium && echo "[SUCCESS] make libsodium"
    make_libyaml && echo "[SUCCESS] make libyaml"
}

config_php() {
    rm ./configure
    ./buildconf --force
    mv main/php_config.h.in /tmp/cnt
    echo -ne '#ifndef __PHP_CONFIG_H\n#define __PHP_CONFIG_H\n' > main/php_config.h.in
    cat /tmp/cnt >> main/php_config.h.in
    echo -ne '\n#endif\n' >> main/php_config.h.in
    echo $OPTIONS
    echo $PKG_CONFIG_PATH
    ./configure $OPTIONS
}

make_php() {
    make EXTRA_CFLAGS='-fno-ident -Xcompiler -march=nehalem -Xcompiler -mtune=haswell -Os' \
    EXTRA_LDFLAGS_PROGRAM='-all-static -fno-ident -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/lib -framework CoreFoundation -framework SystemConfiguration -undefined dynamic_lookup -lwebp -licudata -licui18n -licuio -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/openssl/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libiconv/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/gmp/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libpng/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/lib64 -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/freetype/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libwebp/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/bzip2/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/imagemagick/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/curl/lib -L/Users/sean/Documents/php-work/swoole-cli-4.x/opt/usr/libyaml/lib '  -j 8 && echo ""
}

help() {
    echo "./make.sh docker-bash"
    echo "./make.sh config"
    echo "./make.sh build"
    echo "./make.sh archive"
    echo "./make.sh all-library"
    echo "./make.sh clean-all-library"
    echo "./make.sh sync"
}

if [ "$1" = "docker-build" ] ;then
  sudo docker build -t phpswoole/swoole_cli_os:1.4 .
elif [ "$1" = "docker-bash" ] ;then
    sudo docker run -it -v $ROOT:/Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli -v /home/htf/workspace/swoole:/Users/sean/Documents/php-work/swoole-cli-4.x/swoole-cli/ext/swoole phpswoole/swoole_cli_os:1.4 /bin/bash
    exit 0
elif [ "$1" = "all-library" ] ;then
    make_all_library
elif [ "$1" = "openssl" ] ;then
    make_openssl && echo "[SUCCESS] make openssl"
elif [ "$1" = "clean-openssl" ] ;then
    clean_openssl && echo "[SUCCESS] make clean openssl"
elif [ "$1" = "libiconv" ] ;then
    make_libiconv && echo "[SUCCESS] make libiconv"
elif [ "$1" = "clean-libiconv" ] ;then
    clean_libiconv && echo "[SUCCESS] make clean libiconv"
elif [ "$1" = "libxml2" ] ;then
    make_libxml2 && echo "[SUCCESS] make libxml2"
elif [ "$1" = "clean-libxml2" ] ;then
    clean_libxml2 && echo "[SUCCESS] make clean libxml2"
elif [ "$1" = "libxslt" ] ;then
    make_libxslt && echo "[SUCCESS] make libxslt"
elif [ "$1" = "clean-libxslt" ] ;then
    clean_libxslt && echo "[SUCCESS] make clean libxslt"
elif [ "$1" = "gmp" ] ;then
    make_gmp && echo "[SUCCESS] make gmp"
elif [ "$1" = "clean-gmp" ] ;then
    clean_gmp && echo "[SUCCESS] make clean gmp"
elif [ "$1" = "giflib" ] ;then
    make_giflib && echo "[SUCCESS] make giflib"
elif [ "$1" = "clean-giflib" ] ;then
    clean_giflib && echo "[SUCCESS] make clean giflib"
elif [ "$1" = "libpng" ] ;then
    make_libpng && echo "[SUCCESS] make libpng"
elif [ "$1" = "clean-libpng" ] ;then
    clean_libpng && echo "[SUCCESS] make clean libpng"
elif [ "$1" = "libjpeg" ] ;then
    make_libjpeg && echo "[SUCCESS] make libjpeg"
elif [ "$1" = "clean-libjpeg" ] ;then
    clean_libjpeg && echo "[SUCCESS] make clean libjpeg"
elif [ "$1" = "freetype" ] ;then
    make_freetype && echo "[SUCCESS] make freetype"
elif [ "$1" = "clean-freetype" ] ;then
    clean_freetype && echo "[SUCCESS] make clean freetype"
elif [ "$1" = "libwebp" ] ;then
    make_libwebp && echo "[SUCCESS] make libwebp"
elif [ "$1" = "clean-libwebp" ] ;then
    clean_libwebp && echo "[SUCCESS] make clean libwebp"
elif [ "$1" = "sqlite3" ] ;then
    make_sqlite3 && echo "[SUCCESS] make sqlite3"
elif [ "$1" = "clean-sqlite3" ] ;then
    clean_sqlite3 && echo "[SUCCESS] make clean sqlite3"
elif [ "$1" = "zlib" ] ;then
    make_zlib && echo "[SUCCESS] make zlib"
elif [ "$1" = "clean-zlib" ] ;then
    clean_zlib && echo "[SUCCESS] make clean zlib"
elif [ "$1" = "bzip2" ] ;then
    make_bzip2 && echo "[SUCCESS] make bzip2"
elif [ "$1" = "clean-bzip2" ] ;then
    clean_bzip2 && echo "[SUCCESS] make clean bzip2"
elif [ "$1" = "icu" ] ;then
    make_icu && echo "[SUCCESS] make icu"
elif [ "$1" = "clean-icu" ] ;then
    clean_icu && echo "[SUCCESS] make clean icu"
elif [ "$1" = "oniguruma" ] ;then
    make_oniguruma && echo "[SUCCESS] make oniguruma"
elif [ "$1" = "clean-oniguruma" ] ;then
    clean_oniguruma && echo "[SUCCESS] make clean oniguruma"
elif [ "$1" = "zip" ] ;then
    make_zip && echo "[SUCCESS] make zip"
elif [ "$1" = "clean-zip" ] ;then
    clean_zip && echo "[SUCCESS] make clean zip"
elif [ "$1" = "cares" ] ;then
    make_cares && echo "[SUCCESS] make cares"
elif [ "$1" = "clean-cares" ] ;then
    clean_cares && echo "[SUCCESS] make clean cares"
elif [ "$1" = "imagemagick" ] ;then
    make_imagemagick && echo "[SUCCESS] make imagemagick"
elif [ "$1" = "clean-imagemagick" ] ;then
    clean_imagemagick && echo "[SUCCESS] make clean imagemagick"
elif [ "$1" = "curl" ] ;then
    make_curl && echo "[SUCCESS] make curl"
elif [ "$1" = "clean-curl" ] ;then
    clean_curl && echo "[SUCCESS] make clean curl"
elif [ "$1" = "libsodium" ] ;then
    make_libsodium && echo "[SUCCESS] make libsodium"
elif [ "$1" = "clean-libsodium" ] ;then
    clean_libsodium && echo "[SUCCESS] make clean libsodium"
elif [ "$1" = "libyaml" ] ;then
    make_libyaml && echo "[SUCCESS] make libyaml"
elif [ "$1" = "clean-libyaml" ] ;then
    clean_libyaml && echo "[SUCCESS] make clean libyaml"
elif [ "$1" = "config" ] ;then
    config_php
elif [ "$1" = "build" ] ;then
    make_php
elif [ "$1" = "archive" ] ;then
    cd bin
    SWOOLE_VERSION=$(./swoole-cli -r "echo SWOOLE_VERSION;")
    SWOOLE_CLI_FILE=swoole-cli-v${SWOOLE_VERSION}-linux-x64.tar.xz
    strip swoole-cli
    tar -cJvf ${SWOOLE_CLI_FILE} swoole-cli LICENSE
    mv ${SWOOLE_CLI_FILE} ../
    cd -
elif [ "$1" = "clean-all-library" ] ;then
    clean_openssl && echo "[SUCCESS] make clean [openssl]"
    clean_libiconv && echo "[SUCCESS] make clean [libiconv]"
    clean_libxml2 && echo "[SUCCESS] make clean [libxml2]"
    clean_libxslt && echo "[SUCCESS] make clean [libxslt]"
    clean_gmp && echo "[SUCCESS] make clean [gmp]"
    clean_giflib && echo "[SUCCESS] make clean [giflib]"
    clean_libpng && echo "[SUCCESS] make clean [libpng]"
    clean_libjpeg && echo "[SUCCESS] make clean [libjpeg]"
    clean_freetype && echo "[SUCCESS] make clean [freetype]"
    clean_libwebp && echo "[SUCCESS] make clean [libwebp]"
    clean_sqlite3 && echo "[SUCCESS] make clean [sqlite3]"
    clean_zlib && echo "[SUCCESS] make clean [zlib]"
    clean_bzip2 && echo "[SUCCESS] make clean [bzip2]"
    clean_icu && echo "[SUCCESS] make clean [icu]"
    clean_oniguruma && echo "[SUCCESS] make clean [oniguruma]"
    clean_zip && echo "[SUCCESS] make clean [zip]"
    clean_cares && echo "[SUCCESS] make clean [cares]"
    clean_imagemagick && echo "[SUCCESS] make clean [imagemagick]"
    clean_curl && echo "[SUCCESS] make clean [curl]"
    clean_libsodium && echo "[SUCCESS] make clean [libsodium]"
    clean_libyaml && echo "[SUCCESS] make clean [libyaml]"
elif [ "$1" = "diff-configure" ] ;then
  meld $SRC/configure.ac ./configure.ac
elif [ "$1" = "pkg-check" ] ;then
    echo "[openssl]"
    pkg-config --libs openssl
    echo "==========================================================="
    echo "[libiconv]"
    pkg-config --libs libiconv
    echo "==========================================================="
    echo "[libxml2]"
    pkg-config --libs libxml-2.0
    echo "==========================================================="
    echo "[libxslt]"
    pkg-config --libs libxslt
    echo "==========================================================="
    echo "[gmp]"
    pkg-config --libs gmp
    echo "==========================================================="
    echo "[giflib]"
    pkg-config --libs giflib
    echo "==========================================================="
    echo "[libpng]"
    pkg-config --libs libpng
    echo "==========================================================="
    echo "[libjpeg]"
    pkg-config --libs libjpeg
    echo "==========================================================="
    echo "[freetype]"
    pkg-config --libs freetyp2
    echo "==========================================================="
    echo "[libwebp]"
    pkg-config --libs libwebp
    echo "==========================================================="
    echo "[sqlite3]"
    pkg-config --libs sqlite3
    echo "==========================================================="
    echo "[zlib]"
    pkg-config --libs zlib
    echo "==========================================================="
    echo "[bzip2]"
    pkg-config --libs bzip2
    echo "==========================================================="
    echo "[icu]"
    pkg-config --libs icu-i18n
    echo "==========================================================="
    echo "[oniguruma]"
    pkg-config --libs oniguruma
    echo "==========================================================="
    echo "[zip]"
    pkg-config --libs libzip
    echo "==========================================================="
    echo "[cares]"
    pkg-config --libs libcares
    echo "==========================================================="
    echo "[imagemagick]"
    pkg-config --libs ImageMagick
    echo "==========================================================="
    echo "[curl]"
    pkg-config --libs libcurl
    echo "==========================================================="
    echo "[libsodium]"
    pkg-config --libs libsodium
    echo "==========================================================="
    echo "[libyaml]"
    pkg-config --libs yaml-0.1
    echo "==========================================================="
elif [ "$1" = "sync" ] ;then
  echo "sync"
  rm -rf ./Zend ./ext ./main ./build ./TSRM
  mkdir -p ./ext/
  # ZendVM
  cp -r $SRC/Zend ./
  # Extension
  cp -r $SRC/ext/bcmath ./ext/
  cp -r $SRC/ext/bz2 ./ext/
  cp -r $SRC/ext/calendar ./ext/
  cp -r $SRC/ext/ctype ./ext/
  cp -r $SRC/ext/curl ./ext/
  cp -r $SRC/ext/date ./ext/
  cp -r $SRC/ext/dom ./ext/
  cp -r $SRC/ext/exif ./ext/
  cp -r $SRC/ext/fileinfo ./ext/
  cp -r $SRC/ext/filter ./ext/
  cp -r $SRC/ext/gd ./ext/
  cp -r $SRC/ext/gettext ./ext/
  cp -r $SRC/ext/gmp ./ext/
  cp -r $SRC/ext/hash ./ext/
  cp -r $SRC/ext/iconv ./ext/
  cp -r $SRC/ext/intl ./ext/
  cp -r $SRC/ext/json ./ext/
  cp -r $SRC/ext/libxml ./ext/
  cp -r $SRC/ext/mbstring ./ext/
  cp -r $SRC/ext/mysqli ./ext/
  cp -r $SRC/ext/mysqlnd ./ext/
  cp -r $SRC/ext/opcache ./ext/
  cp -r $SRC/ext/openssl ./ext/
  cp -r $SRC/ext/pcntl ./ext/
  cp -r $SRC/ext/pcre ./ext/
  cp -r $SRC/ext/pdo ./ext/
  cp -r $SRC/ext/pdo_mysql ./ext/
  cp -r $SRC/ext/pdo_sqlite ./ext/
  cp -r $SRC/ext/phar ./ext/
  cp -r $SRC/ext/posix ./ext/
  cp -r $SRC/ext/readline ./ext/
  cp -r $SRC/ext/reflection ./ext/
  cp -r $SRC/ext/session ./ext/
  cp -r $SRC/ext/simplexml ./ext/
  cp -r $SRC/ext/soap ./ext/
  cp -r $SRC/ext/sockets ./ext/
  cp -r $SRC/ext/sodium ./ext/
  cp -r $SRC/ext/spl ./ext/
  cp -r $SRC/ext/sqlite3 ./ext/
  cp -r $SRC/ext/standard ./ext/
  cp -r $SRC/ext/sysvshm ./ext/
  cp -r $SRC/ext/tokenizer ./ext/
  cp -r $SRC/ext/xml ./ext/
  cp -r $SRC/ext/xmlreader ./ext/
  cp -r $SRC/ext/xmlwriter ./ext/
  cp -r $SRC/ext/xsl ./ext/
  cp -r $SRC/ext/zip ./ext/
  cp -r $SRC/ext/zlib ./ext/
  # main
  cp -r $SRC/main ./
  cp -r $SRC/build ./
  cp -r $SRC/TSRM ./
  cp -r ./TSRM/TSRM.h main/TSRM.h
  cp -r $SRC/configure.ac ./
  exit 0
else
    help
fi

