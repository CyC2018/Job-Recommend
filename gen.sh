#!/bin/bash
# use this scirpt to generate README.md
# after you add your company to company.txt
# and add the logo to assets with format `logo-<company>.[png/jpg]`
# and the description to infos folder with a markdown file named
# with your company name as well.

exec &> README.md

echo '<table align="center">'

line=0
for company in `cat company.txt`;do
    [[ $((line%5)) == 0 ]] && printf "</tr><tr>\n"
    let line+=1
    logo="logo-$company.png"
    [[ -f "assets/$logo" ]] || logo="logo-$company.jpg"
    printf "  <td align=\"center\">\n"
    printf "    <a href=\"infos/%s.md\">\n" $company
    printf "      <img src=\"assets/%s\" width=\"140px\">\n" $logo
    printf "      <p>%s</p>\n" $company
    printf "    </a>\n"
    printf "  </td>\n"
done

echo '</table>'