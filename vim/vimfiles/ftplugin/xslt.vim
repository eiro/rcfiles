setf xml

inoremap <buffer> <leader>inc <xsl:include href=""/><c-o>2h
inoremap <buffer> <leader>at <xsl:apply-templates select="" /><esc>3hi
inoremap <buffer> <leader>ch <xsl:choose><cr><xsl:when test=""><cr></xsl:when><cr><xsl:otherwise><cr></xsl:otherwise><cr></xsl:choose><esc>4k$hi
inoremap <buffer> <leader>co <xsl:copy-of select="" /><esc>3hi
inoremap <buffer> <leader>ct <xsl:call-template name="" ><cr><xsl:with-param name="" select="" /><cr></xsl:call-template><esc>2k$2hi
inoremap <buffer> <leader>wp <xsl:with-param name="" select="" /><esc>13hi
inoremap <buffer> <leader>fe <xsl:for-each select="" ><cr></xsl:for-each><esc>k$2hi
inoremap <buffer> <leader>if <xsl:if test="" ><cr></xsl:if><esc>k$2hi
inoremap <buffer> <leader>el <xsl:element test="" ><cr></xsl:element><esc>k$2hi
inoremap <buffer> <leader>msg <xsl:message></xsl:message><esc>13hi
inoremap <buffer> <leader>par <xsl:param name="" select="" ></xsl:param><esc>24hi
inoremap <buffer> <leader>tm <xsl:template match="" ><cr></xsl:template><esc>k$2hi
inoremap <buffer> <leader>tn <xsl:template name="" ><cr></xsl:template><esc>k$2hi
inoremap <buffer> <leader>txt <xsl:text></xsl:text><esc>10hi
inoremap <buffer> <leader>var <xsl:variable name="" select="" /><esc>13hi
inoremap <buffer> <leader>vo <xsl:value-of select="" /><esc>4ha
inoremap <buffer> <leader>num <xsl:number format="" select="" /><esc>13hi

inoremap <buffer> <leader>=se select=""<esc>i
inoremap <buffer> <leader>=ma match=""<esc>i
inoremap <buffer> <leader>=mo mode=""<esc>i
inoremap <buffer> <leader>=ve version=""<esc>i
inoremap <buffer> <leader>:ps preceding-sibling::
inoremap <buffer> <leader>:fs following-sibling::
inoremap <buffer> <leader>:an ancestor::
inoremap <buffer> <leader>do document('')<esc>hi
inoremap <buffer> <leader>co count()<esc>i
