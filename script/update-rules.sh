#!/bin/sh
LC_ALL='C'
AA="Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_2 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8H7 Safari/6533.18.5 Quark/2.4.2.986"
rm *.txt
rm -rf md5 tmp
wait
# Create temporary folder
echo '新建TMP文件夹...'
mkdir -p ./tmp/
cd tmp
echo '新建TMP文件夹完成'

# Start Download Filter File
echo '开始下载规则...'
easylist=( 
  #一个URL过滤器
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt" 
  #乘风视频广告规则
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" 
  #大萌主针的盗版网站的规则
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" 
  #Clean Url 扩展的规则
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt" 
  #Noyllopa的去APP下载按钮
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" 
  #防跟踪保护过滤器
  "https://filters.adtidy.org/windows/filters/3.txt"
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  #英+中过滤器
  "https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt"
  #中文过滤器
  "https://filters.adtidy.org/windows/filters/224.txt" 
  #英文过滤器 优化版
  "https://filters.adtidy.org/windows/filters/2_optimized.txt"
)

easylist_plus=(
  #ubo烦人过滤器
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" 
  #UBO危险软件
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" 
  #ubo基础过滤器
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt" 
  #ubo隐私保护
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt" 
)

adguard=(
  #adg基础过滤器
  "https://filters.adtidy.org/android/filters/2_optimized.txt" 
  #adg移动设备过滤器
  "https://filters.adtidy.org/android/filters/11_optimized.txt" 
  #adgURL过滤器
  "https://filters.adtidy.org/android/filters/17_optimized.txt"  
  #adg防跟踪
  "https://filters.adtidy.org/android/filters/3_optimized.txt" 
  #adg中文过滤器
  "https://filters.adtidy.org/android/filters/224_optimized.txt" 
  #adg烦人过滤器
  "https://filters.adtidy.org/android/filters/14_optimized.txt" 
  #adg社交过滤器
  "https://filters.adtidy.org/android/filters/4_optimized.txt" 
)

adguard_full=(
  #adg基础过滤器
  "https://filters.adtidy.org/windows/filters/2.txt" 
  #adg移动设备过滤器
  "https://filters.adtidy.org/windows/filters/11.txt" 
  #adg防跟踪
  "https://filters.adtidy.org/windows/filters/3.txt" 
  #adg中文过滤器
  "https://filters.adtidy.org/windows/filters/224.txt" 
  #adg烦人过滤器
  "https://filters.adtidy.org/windows/filters/14.txt" 
  #adg社交过滤器
  "https://filters.adtidy.org/windows/filters/4.txt" 
  #adgURL过滤器
  "https://filters.adtidy.org/windows/filters/17.txt"  
)

allow=(
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/GermanFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/TurkishFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/whitelist.txt"
)

dns=(
  #以下规则不做阐述
  "https://filters.adtidy.org/windows/filters/224.txt" #adg中文过滤器
  "https://filters.adtidy.org/windows/filters/3.txt"
  "https://filters.adtidy.org/windows/filters/11.txt"
  "https://filters.adtidy.org/windows/filters/2.txt"
  "https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt"
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
  "https://raw.githubusercontent.com/durablenapkin/scamblocklist/master/adguard.txt"
  "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
  "https://raw.githubusercontent.com/hacamer/AdRule/main/dns.txt"
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" 
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" 
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" 
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
)

hosts=(
  "https://adaway.org/hosts.txt"
  "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"
)

allow_domains=(
  "https://raw.githubusercontent.com/privacy-protection-tools/dead-horse/master/anti-ad-white-list.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
)

dead_hosts=(
  "https://raw.githubusercontent.com/notracking/hosts-blocklists-scripts/master/domains.dead.txt"
  "https://raw.githubusercontent.com/notracking/hosts-blocklists-scripts/master/hostnames.dead.txt"
)


for i in "${!easylist[@]}" "${!easylist_plus[@]}" "${!adguard_full[@]}" "${!adguard[@]}" "${!allow[@]}" "${!hosts[@]}" "${!dns[@]}" 
do
  curl --parallel --parallel-immediate -k -L -C - -o "easylist${i}.txt" --connect-timeout 30 -s "${easylist[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "plus-easylist${i}.txt" --connect-timeout 30 -s "${easylist_plus[$i]}"  |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "full-adguard${i}.txt" --connect-timeout 30 -s "${adguard_full[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "adguard${i}.txt" --connect-timeout 30 -s "${adguard[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 30 -s "${allow[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 30 -s "${dns[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 30 -s "${hosts[$i]}" |iconv -t utf-8 &
  # shellcheck disable=SC2181
done
wait

echo '规则下载完成'

# 添加空格
file="$(ls|sort -u)"
for i in $file; do
  echo -e '\n\n\n' >> $i &
done
wait
# Pre Fix rules
echo '处理规则中...'

# Start Merge and Duplicate Removal

echo 开始合并

#处理主规则
cat .././mod/rules/adblock-rules.txt easylist*.txt \
 | grep -Ev "^((\!)|(\[)).*" \
 | grep -v 'local.adguard.org' \
 |grep -E -v "^[\.||]+[com]+[\^]$" \
 | sort -n | uniq >> tmp-adblock1.txt  
#去掉误杀规则
cat tmp-adblock1.txt .././mod/rules/ex*adblock-rules.txt .././mod/rules/ex*adblock-rules.txt \
 |sort -n |uniq -u >tmp-adblock.txt
#清理缓存
rm -f tmp-adblock1.txt

#处理Plus规则
cat tmp-adblock.txt plus*easylist*.txt full-adg*.txt \
 |grep -Ev "^((\!)|(\[)).*" | grep -v 'local.adguard.org' \
 | sort -u |grep -v '^ '| sort -n | uniq | awk '!a[$0]++' > tmp-adblock_plus.txt  

#处理AdGuard的规则
cat adguard*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard.txt  

#处理AdGuard的Full规则
cat full-adguard*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full.txt  

#处理DNS级别规则
bash ../script/rebuilt-dns-list.sh
wait

cd ../tmp/
mv ../{dns.txt,hosts.txt,ad-domains.txt} ./
rename 's/^/tmp-/' dns.txt hosts.txt ad-domains.txt
sed -i 's/^\!.*//g' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
sed -i 's/^\#.*//g' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
sed -i '/^$/d' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
rm -f ../{dns.txt,hosts.txt,ad-domains.txt}
cat .././mod/rules/* *.txt | grep '^@' \
 | sort -n | uniq > tmp-allow.txt 


echo 规则合并完成
# Move to Pre Filter
echo '移动规则到Pre目录'
cd ../
mkdir -p ./pre/
cp ./tmp/tmp-*.txt ./pre
cd ./pre
echo '移动完成'


# Start Add title and date
diffFile="$(ls|sort -u)"
for i in $diffFile; do
 python .././script/rule.py $i
 n=`cat $i | wc -l` 
 echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')(GMT+8) " >> tpdate.txt 
 new=$(echo "$i" |sed 's/tmp-//g') 
 echo "! Total count: $n" > $i-tpdate.txt 
 cat ./tpdate.txt ./$i-tpdate.txt ./$i |grep -Ev "^(\|)*(\.)?com(\^)?$" > ./$new 
 rm $i *tpdate.txt 
done

echo '规则添加统计数据完成'
# Add Title and MD5
cd ../
mkdir -p ./md5/
diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#') 
 cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i 
 sed -i '/^$/d' $i 
 md5sum $i | sed "s/$i//" > ./md5/$i.md5 
 perl ./script/addchecksum.pl ./$i &
 iconv -t UTF-8 $i > tmp-$i
 mv -f tmp-$i $i
 #echo "合并${i}的标题中"
done
wait
echo '规则处理完成'
sed -i 's/!/#/g' hosts.txt
rm -rf pre tmp
exit
