 #!/usr/bin/env bash

# RVM checks a signature before installing.  This gets that signature.
rm -rf ~/.gnupg/
curl -#LO https://rvm.io/mpapis.asc
gpg --import mpapis.asc

curl -sSL https://get.rvm.io | bash -s $1