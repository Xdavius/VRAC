      # Maintainer: lemust83 <lemust83420@gmail.com>
        pkgname=readesm-en
        pkgver=2.4
        pkgrel=2
        pkgdesc="lire les fichiers Tachographs issus de Cardpeek ou autres  dans un format humainement compréhensible"
        arch=(i686 x86_64)
        url="http://readesm.sourceforge.net/help.html"
        license=('GPL')
        groups=()
        depends=('boost' 'gmp' 'libgcrypt' 'qt4-bin' 'qtwebkit-bin' 'python2')
        makedepends=('cmake')
        replaces=('readesm' 'readesm-fr' )
        # source=("./")		
        # sha256sums=("SKIP")

        build() {
          cd "$srcdir/readesm-en/fileformat"
          python2 ./generate.py
          cd ..
          mkdir build
          cd build
          cmake ..
          make
         }

        package ()
       {
        cd "$srcdir/readesm-en/build"
        make DESTDIR="$pkgdir" install
       }

