#!/bin/bash

cat > plik3 << EOF
	Test1 $USER
EOF

cat > plik4 <<- EOF
	Test1 $USER
	Test2
EOF
