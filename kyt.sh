#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�q�`  ��� }���o�����    P����wGlXI!4#@��M'��!�hS�Ѡ4mO(=@	I2��M�!�d2       H���ɢ�$�yM6�hh� M�1 �42i��F��FF�@bhɠ��I=#�M&2���@�@ Q<\F��1C+7��Z$d0�NQtKG�0����w�R�������d�(����d�1����.,ڠ�4���&����\aAGf�V�r��t0O(~"�����Qr��&V��1��d��}��E{d�������<�*�?yy�wn�?�z��n�m�+�]���U�N���_9��3p�%.\�RoK؆%�vn��MP�m��ڙ�h�I���Q4>��G~��$ehG1��B���~aijH�Y��$IM/?&٫U�$B>�c�j��lb�	
9=�2/0]u�4�|PXPIѯ^��GW��yd�qh�o��+ߖ�Ì���Fa2��['��T@q��Z�����@�UR]��k:눇�h_���S_S�B���c6����x��Z�3g_�OU���P�{��������|GOK3&"��GL��꛰2:3�,Ԝ1ԗ�ȦU)���Qu�QmȈ�M��a��۶��5K-k�q0�a*Eb��Ŗ#�R�@*���!S�躜�>�F���cK+�p�y����r'% �W��LzF$N=
�rO|�a�������i�)�Q]�	:7�W��C�$1���S�V�.�@�T�Q}n��Rʣ��1��+�ш��?�����k��k<:�_Ѓ��h�R�(��֗U��å�����Z�h��@-�n#���V~�¬���&��Y�E�z�]c��R+BJ5�� L����&�h[y3ڮ�"�?,=~�n����0���+Ѵ��lY�)�1r�B��h��2a��0u1��4��ǉU�B�6i��;P�`i�J-�QP����b���%azd��ù���Aq4���/��ʼ� m����'R�ьf�rTt�Lٝ��;.:fR����2^��?������p�q�աXRT�
?8�p� ��w�!e�MdAUL�E�"vjj��I%�$��HIL��ܑN$5�s 