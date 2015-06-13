<a href='http://www.cstutoringcenter.com/problems/'>Cstutoringcenter</a> is a website of about 80 programming and math related problems. The problems are meant for C++ or Java, but can be solved in any language. It is similar to Project Euler, but with fewer and easier problems.

This site is currently a private and incomplete SVN. You are welcome to browse the source code, but you cannot contribute to it.

<a href='http://code.google.com/p/cstutoringcenter/source/browse/#svn/trunk'>Solutions</a> mostly in Haskell.


---


To run:

  * All Haskell solutions that do not use input from a file can be loaded with GHCI or HUGS and run with `run`. Programs which take a long time to run can be sped up with `ghc --make -O2 p.hs` but a main is required: insert `main = print run` for it to compile.

  * Haskell programs that require file input starts in `main`: Either load it in GHCI or compile it and run it as normal.

  * A few programs use other languages; Use the appropriate compilers and interpreters.

  * Every solution has been tested to work at least once. Problems may change, and not all answers (especially decimal solutions) are in the correct format. The actual answer may be in another format (ex. last 5 digits of a number).