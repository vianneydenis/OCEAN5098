---
title: "dplyr"
---




<div class="layout-chunk" data-layout="l-body">
`<a href="data:text/x-markdown;base64,LS0tDQp0aXRsZTogImRwbHlyIg0KLS0tDQoNCmBgYHtyIGV2YWwgPSBUUlVFLCAgbWVzc2FnZT1GLCBpbmNsdWRlPUYsIHdhcm5pbmc9RiwgcHVybD1GLCByZXN1bHRzPSJoaWRlIn0NCmtuaXRyOjpwdXJsKCdkcGx5ci5SbWQnLCBkb2N1bWVudGF0aW9uID0gRikNCmBgYA0KDQoNCmBgYHtyIGVjaG89RkFMU0UsIHB1cmw9Rn0NCnhmdW46OmVtYmVkX2ZpbGUoJ2RwbHlyLlJtZCcpDQpgYGANCg0KYGBge3IgZWNobz1GQUxTRSwgcHVybD1GfQ0KeGZ1bjo6ZW1iZWRfZmlsZSgnZHBseXIuUicpDQpgYGANCg0KVGhlIHBhY2thZ2UgYGRwbHlyYCBpcyAgZGVkaWNhdGVkIHRvIHRoZSBkYXRhIG1hbmlwdWxhdGlvbiBpbiBSLiBJdCBoYXMgbWFueSBjb21tb24gZnVuY3Rpb25zIHRvIGZhc3RlbiAgZGF0YSBleHBsb3JhdGlvbiBhbmQgdHJhbnNmb3JtYXRpb24uIFNvbWUgaW1wb3J0YW50IGZ1bmN0aW9ucyBmcm9tIHRoaXMgcGFja2FnZXMgYXJlIGNvdmVyZWQgYmVsb3cuDQoNCmBgYHtyIGNsYXNzLnNvdXJjZSA9ICJmb2xkLXNob3ciLCAgZXZhbD1UfQ0KbGlicmFyeSAoZHBseXIpDQpgYGANCg0KDQoNCiMgU3VtbWFyeQ0KDQpUaGUgZnVuY3Rpb24gYHN1bW1hcmlzZWAgaXMgdXNlZCB0byBmaW5kIGluc2lnaHRzIChtZWFuLCBtZWRpYW4sIG1vZGUsIGV0Yy4pIGZyb20gYSBkYXRhc2V0LiBJdCByZWR1Y2VzIG11bHRpcGxlIHZhbHVlcyBkb3duIHRvIGEgc2luZ2xlIHZhbHVlLiBGb3IgZXhhbXBsZToNCg0KYGBge3IsICBldmFsPVR9DQpzdW1tYXJpc2VkIDwtIHN1bW1hcmlzZShpcmlzLCBNZWFuLldpZHRoID0gbWVhbihTZXBhbC5XaWR0aCkpDQpoZWFkKHN1bW1hcmlzZWQpDQpgYGANCg0KIyBNYW5pcHVsYXRpb24NCg0KIyMgYHNlbGVjdGANCg0KSXQgaXMgdXNlZCB0byBzZWxlY3QgZGF0YSBieSBjb2x1bW4gbmFtZS4gU2V2ZXJhbCBzeW50YXhlcyBhcmUgcG9zc2libGUuIEZvciBleGFtcGxlOg0KDQpgYGB7ciBjbGFzcy5zb3VyY2UgPSAiZm9sZC1zaG93IiwgIGV2YWw9VH0NCiMgYnkgY29sdW1uIG5hbWVzDQpzZWxlY3RlZCA8LSBzZWxlY3QoaXJpcywgU2VwYWwuTGVuZ3RoLCBTZXBhbC5XaWR0aCwgUGV0YWwuTGVuZ3RoKQ0KaGVhZChzZWxlY3RlZCkgDQoNCiMgYnkgY29sdW1uIHJhbmdlDQpzZWxlY3RlZDEgPC0gc2VsZWN0KGlyaXMsIFNlcGFsLkxlbmd0aDpQZXRhbC5MZW5ndGgpDQpoZWFkKHNlbGVjdGVkMSwgNCkNCg0KIyBieSBjb2x1bW4gcmFuZ2UgbnVtYmVyDQpzZWxlY3RlZDIgPC0gc2VsZWN0KGlyaXMsYygyOjUpKQ0KaGVhZChzZWxlY3RlZDIpDQpgYGANCg0KVXNlIGAtYCB0byBoaWRlIGEgcGFydGljdWxhciBjb2x1bW4NCg0KYGBge3IsICBldmFsPUZ9DQpzZWxlY3RlZCA8LSBzZWxlY3QoaXJpcywgLVNlcGFsLkxlbmd0aCwgLVNlcGFsLldpZHRoKQ0KYGBgDQoNCiMjIGBmaWx0ZXJgDQoNCkl0IGlzIHVzZWQgdG8gZmlsdGVyIHJvd3Mgd2l0aCBtYXRjaGluZyBjcml0ZXJpYS4gSXQgd29ya3MgaW4gdGVoIHNhbWUgd2F5IHRoYW4gdGhlIGZ1bmN0aW9uIGBzZWxlY3RgIChpLmUuLCB3ZSBwYXNzIGEgZGF0YSBmcmFtZSBhbG9uZyB3aXRoIGEgY29uZGl0aW9uIHNlcGFyYXRlZCBieSBhIGNvbW1hKS4NCg0KLSBTaW5nbGUgY29uZGl0aW9uOg0KDQpgYGB7ciwgIGV2YWw9VH0NCiMgU2VsZWN0IHNldG9zYSBzcGVjaWVzDQpmaWx0ZXJlZCA8LSBmaWx0ZXIoaXJpcywgU3BlY2llcyA9PSAic2V0b3NhIiApDQpoZWFkKGZpbHRlcmVkLDMpDQpgYGANCg0KLSBEdWFsIGNvbmRpdGlvbnM6DQoNCmBgYHtyLCAgZXZhbD1UfQ0KIyBTZWxlY3QgdmVyc2ljb2xvciBzcGVjaWVzIHdpdGggU2VwYWwgd2lkdGggbW9yZSB0aGFuIDMNCmZpbHRlcmVkMSA8LSBmaWx0ZXIoaXJpcywgU3BlY2llcyA9PSAidmVyc2ljb2xvciIsIFNlcGFsLldpZHRoID4gMykNCnRhaWwoZmlsdGVyZWQxKQ0KYGBgDQoNCg0KIyMgYG11dGF0ZWANCg0KSXQgY3JlYXRlcyBuZXcgY29sdW1ucyAodmFyaWFibGVzKSBhbmQgcHJlc2VydmVzIHRoZSBleGlzdGluZyBjb2x1bW5zIGluIGEgZGF0YSBzZXQuIEZvciBleGFtcGxlOg0KDQpgYGB7ciwgIGV2YWw9VH0NCiNUbyBjcmVhdGUgYSBjb2x1bW4g4oCcR3JlYXRlci5IYWxm4oCdIHdoaWNoIHN0b3JlcyBUUlVFIGlmIGdpdmVuIGNvbmRpdGlvbiBpcyBUUlVFDQptdXRhdGVkMSA8LSBtdXRhdGUoaXJpcywgR3JlYXRlci5IYWxmID0gU2VwYWwuV2lkdGggPiAwLjUgKiBTZXBhbC5MZW5ndGgpDQp0YWlsKG11dGF0ZWQxKQ0KYGBgDQoNClRvIGNoZWNrIGhvdyBtYW55IGZsb3dlciBzYXRpc2Z5IHRoaXMgY29uZGl0aW9uLCB0aGUgb3V0cHV0IG9mIHRoZSBmdW5jdGlvbiBgdGFibGV7YmFzZX1gIGlzIGEgY29udGluZ2VuY3kgdGFibGUgd2l0aCB0aGUgbm8uIG9mIGluZGl2aWR1YWwgKGBGQUxTRWAgYW5kIGBUUlVFYCk6DQoNCmBgYHtyLCAgZXZhbD1UfQ0KdGFibGUobXV0YXRlZDEkR3JlYXRlci5IYWxmKQ0KYGBgDQoNCiMjIGBhcnJhbmdlYA0KDQpJdCBpcyB1c2VkIHRvIHNvcnQgcm93cyBieSB2YXJpYWJsZXMgaW4gYm90aCBhbiBhc2NlbmRpbmcgYW5kIGRlc2NlbmRpbmcgb3JkZXIuIEZvciBleGFtcGxlOg0KDQpgYGB7ciwgIGV2YWw9VH0NCiMgU2VwYWwgV2lkdGggYnkgYXNjZW5kaW5nIG9yZGVyDQphcnJhbmdlZCA8LSBhcnJhbmdlKGlyaXMsIFNlcGFsLldpZHRoKQ0KaGVhZChhcnJhbmdlZCkNCg0KIyBTZXBhbCBXaWR0aCBieSBkZXNjZW5kaW5nIG9yZGVyDQphcnJhbmdlZDEgPC0gYXJyYW5nZShpcmlzLCBkZXNjKFNlcGFsLldpZHRoKSkNCmhlYWQoYXJyYW5nZWQxKQ0KYGBgDQoNCiMjIGBncm91cF9ieWANCg0KSXQgaXMgZG9uZSB0byBncm91cCBvYnNlcnZhdGlvbnMgd2l0aGluIGEgZGF0YXNldCBieSBvbmUgb3IgbW9yZSB2YXJpYWJsZXMuIERhdGEgb3BlcmF0aW9ucyBhcmUgb2Z0ZW4gcGVyZm9ybWVkIG9uIGdyb3VwcyBkZWZpbmVkIGJ5IHZhcmlhYmxlcy4gRm9yIGV4YW1wbGUgd2hlbiBjb21iaW5lZDoNCg0KYGBge3IsICBldmFsPVR9DQojIE1lYW4gc2VwYWwgd2lkdGggYnkgU3BlY2llcw0KZ3AgPC0gZ3JvdXBfYnkoaXJpcywgU3BlY2llcykNCmdwLm1lYW4gPC0gc3VtbWFyaXNlKGdwLE1lYW4uU2VwYWwgPSBtZWFuKFNlcGFsLldpZHRoKSkNCmdwLm1lYW4NCmBgYA0KDQpWaXNpdCB0aGUgZm9sbHdvaW5nIFt3ZWJzaXRlXShodHRwczovL2RwbHlyLnRpZHl2ZXJzZS5vcmcvKSBmb3IgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUgYGRwbHlyYCBwYWNrYWdlDQoNCiMgUGlwZSBvcGVyYXRvcg0KDQpUaGUgcGlwZSBvcGVyYXRvciBgJT4lYCBhbGxvd3MgdG8gd3JhcCBtdWx0aXBsZSBmdW5jdGlvbnMgdG9nZXRoZXIuIEl0IGNhbiBiZSB1c2VkIHdpdGggZnVuY3Rpb25zIGxpa2UgYGZpbHRlcmAsIGBzZWxlY3RgLCBgYXJyYW5nZWAsIGBzdW1tYXJpc2VgLCBgZ3JvdXBfYnlgLCBldGMuIEFzIGZvciAgYW4gZXhhbXBsZToNCg0KYGBge3IsICBldmFsPVR9DQojVG8gc2VsZWN0IHRoZSByb3dzIHdpdGggY29uZGl0aW9ucw0KaXJpcyAlPiUgZmlsdGVyKFNwZWNpZXMgPT0gInNldG9zYSIsU2VwYWwuV2lkdGggPiAzLjgpDQpgYGANCg0KVG8gZmluZCBtZWFuIGBTZXBhbGBMZW5ndGggYnkgYFNwZWNpZXNgLCB3ZSB1c2UgdGVoIHBpcGUgb3BlcmF0b3IgYXMgZm9sbG93aW5nOg0KDQpgYGB7ciwgIGV2YWw9VH0NCmlyaXMgICU+JSBncm91cF9ieShTcGVjaWVzKSAlPiUgc3VtbWFyaXNlKE1lYW4uTGVuZ3RoID0gbWVhbihTZXBhbC5MZW5ndGgpKQ0KYGBgDQoNCg==" download="dplyr.Rmd">Download dplyr.Rmd</a>`{=html}

</div>


<div class="layout-chunk" data-layout="l-body">
`<a href="data:text/plain;base64,bGlicmFyeSAoZHBseXIpDQoNCnN1bW1hcmlzZWQgPC0gc3VtbWFyaXNlKGlyaXMsIE1lYW4uV2lkdGggPSBtZWFuKFNlcGFsLldpZHRoKSkNCmhlYWQoc3VtbWFyaXNlZCkNCg0KIyBieSBjb2x1bW4gbmFtZXMNCnNlbGVjdGVkIDwtIHNlbGVjdChpcmlzLCBTZXBhbC5MZW5ndGgsIFNlcGFsLldpZHRoLCBQZXRhbC5MZW5ndGgpDQpoZWFkKHNlbGVjdGVkKSANCg0KIyBieSBjb2x1bW4gcmFuZ2UNCnNlbGVjdGVkMSA8LSBzZWxlY3QoaXJpcywgU2VwYWwuTGVuZ3RoOlBldGFsLkxlbmd0aCkNCmhlYWQoc2VsZWN0ZWQxLCA0KQ0KDQojIGJ5IGNvbHVtbiByYW5nZSBudW1iZXINCnNlbGVjdGVkMiA8LSBzZWxlY3QoaXJpcyxjKDI6NSkpDQpoZWFkKHNlbGVjdGVkMikNCg0Kc2VsZWN0ZWQgPC0gc2VsZWN0KGlyaXMsIC1TZXBhbC5MZW5ndGgsIC1TZXBhbC5XaWR0aCkNCg0KIyBTZWxlY3Qgc2V0b3NhIHNwZWNpZXMNCmZpbHRlcmVkIDwtIGZpbHRlcihpcmlzLCBTcGVjaWVzID09ICJzZXRvc2EiICkNCmhlYWQoZmlsdGVyZWQsMykNCg0KIyBTZWxlY3QgdmVyc2ljb2xvciBzcGVjaWVzIHdpdGggU2VwYWwgd2lkdGggbW9yZSB0aGFuIDMNCmZpbHRlcmVkMSA8LSBmaWx0ZXIoaXJpcywgU3BlY2llcyA9PSAidmVyc2ljb2xvciIsIFNlcGFsLldpZHRoID4gMykNCnRhaWwoZmlsdGVyZWQxKQ0KDQojVG8gY3JlYXRlIGEgY29sdW1uIOKAnEdyZWF0ZXIuSGFsZuKAnSB3aGljaCBzdG9yZXMgVFJVRSBpZiBnaXZlbiBjb25kaXRpb24gaXMgVFJVRQ0KbXV0YXRlZDEgPC0gbXV0YXRlKGlyaXMsIEdyZWF0ZXIuSGFsZiA9IFNlcGFsLldpZHRoID4gMC41ICogU2VwYWwuTGVuZ3RoKQ0KdGFpbChtdXRhdGVkMSkNCg0KdGFibGUobXV0YXRlZDEkR3JlYXRlci5IYWxmKQ0KDQojIFNlcGFsIFdpZHRoIGJ5IGFzY2VuZGluZyBvcmRlcg0KYXJyYW5nZWQgPC0gYXJyYW5nZShpcmlzLCBTZXBhbC5XaWR0aCkNCmhlYWQoYXJyYW5nZWQpDQoNCiMgU2VwYWwgV2lkdGggYnkgZGVzY2VuZGluZyBvcmRlcg0KYXJyYW5nZWQxIDwtIGFycmFuZ2UoaXJpcywgZGVzYyhTZXBhbC5XaWR0aCkpDQpoZWFkKGFycmFuZ2VkMSkNCg0KIyBNZWFuIHNlcGFsIHdpZHRoIGJ5IFNwZWNpZXMNCmdwIDwtIGdyb3VwX2J5KGlyaXMsIFNwZWNpZXMpDQpncC5tZWFuIDwtIHN1bW1hcmlzZShncCxNZWFuLlNlcGFsID0gbWVhbihTZXBhbC5XaWR0aCkpDQpncC5tZWFuDQoNCiNUbyBzZWxlY3QgdGhlIHJvd3Mgd2l0aCBjb25kaXRpb25zDQppcmlzICU+JSBmaWx0ZXIoU3BlY2llcyA9PSAic2V0b3NhIixTZXBhbC5XaWR0aCA+IDMuOCkNCg0KaXJpcyAgJT4lIGdyb3VwX2J5KFNwZWNpZXMpICU+JSBzdW1tYXJpc2UoTWVhbi5MZW5ndGggPSBtZWFuKFNlcGFsLkxlbmd0aCkpDQpgYGB7LnIgLmRpc3RpbGwtZm9yY2UtaGlnaGxpZ2h0aW5nLWNzc30NCmBgYA0K" download="dplyr.R">Download dplyr.R</a>`{=html}

</div>


The package `dplyr` is  dedicated to the data manipulation in R. It has many common functions to fasten  data exploration and transformation. Some important functions from this packages are covered below.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='kw'><a href='https://rdrr.io/r/base/library.html'>library</a></span> <span class='op'>(</span><span class='va'><a href='https://dplyr.tidyverse.org'>dplyr</a></span><span class='op'>)</span>
</code></pre></div>

</div>




# Summary

The function `summarise` is used to find insights (mean, median, mode, etc.) from a dataset. It reduces multiple values down to a single value. For example:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>summarised</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/summarise.html'>summarise</a></span><span class='op'>(</span><span class='va'>iris</span>, Mean.Width <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='op'>(</span><span class='va'>Sepal.Width</span><span class='op'>)</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>summarised</span><span class='op'>)</span>
</code></pre></div>

```
  Mean.Width
1   3.057333
```

</div>


# Manipulation

## `select`

It is used to select data by column name. Several syntaxes are possible. For example:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># by column names</span>
<span class='va'>selected</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/select.html'>select</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='va'>Sepal.Length</span>, <span class='va'>Sepal.Width</span>, <span class='va'>Petal.Length</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>selected</span><span class='op'>)</span> 
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length
1          5.1         3.5          1.4
2          4.9         3.0          1.4
3          4.7         3.2          1.3
4          4.6         3.1          1.5
5          5.0         3.6          1.4
6          5.4         3.9          1.7
```

<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># by column range</span>
<span class='va'>selected1</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/select.html'>select</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='va'>Sepal.Length</span><span class='op'>:</span><span class='va'>Petal.Length</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>selected1</span>, <span class='fl'>4</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length
1          5.1         3.5          1.4
2          4.9         3.0          1.4
3          4.7         3.2          1.3
4          4.6         3.1          1.5
```

<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># by column range number</span>
<span class='va'>selected2</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/select.html'>select</a></span><span class='op'>(</span><span class='va'>iris</span>,<span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='fl'>2</span><span class='op'>:</span><span class='fl'>5</span><span class='op'>)</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>selected2</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Width Petal.Length Petal.Width Species
1         3.5          1.4         0.2  setosa
2         3.0          1.4         0.2  setosa
3         3.2          1.3         0.2  setosa
4         3.1          1.5         0.2  setosa
5         3.6          1.4         0.2  setosa
6         3.9          1.7         0.4  setosa
```

</div>


Use `-` to hide a particular column

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>selected</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/select.html'>select</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='op'>-</span><span class='va'>Sepal.Length</span>, <span class='op'>-</span><span class='va'>Sepal.Width</span><span class='op'>)</span>
</code></pre></div>

</div>


## `filter`

It is used to filter rows with matching criteria. It works in teh same way than the function `select` (i.e., we pass a data frame along with a condition separated by a comma).

- Single condition:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># Select setosa species</span>
<span class='va'>filtered</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/filter.html'>filter</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='va'>Species</span> <span class='op'>==</span> <span class='st'>"setosa"</span> <span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>filtered</span>,<span class='fl'>3</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
```

</div>


- Dual conditions:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># Select versicolor species with Sepal width more than 3</span>
<span class='va'>filtered1</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/filter.html'>filter</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='va'>Species</span> <span class='op'>==</span> <span class='st'>"versicolor"</span>, <span class='va'>Sepal.Width</span> <span class='op'>&gt;</span> <span class='fl'>3</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>tail</a></span><span class='op'>(</span><span class='va'>filtered1</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
3          6.9         3.1          4.9         1.5 versicolor
4          6.3         3.3          4.7         1.6 versicolor
5          6.7         3.1          4.4         1.4 versicolor
6          5.9         3.2          4.8         1.8 versicolor
7          6.0         3.4          4.5         1.6 versicolor
8          6.7         3.1          4.7         1.5 versicolor
```

</div>



## `mutate`

It creates new columns (variables) and preserves the existing columns in a data set. For example:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'>#To create a column “Greater.Half” which stores TRUE if given condition is TRUE</span>NA<span class='va'>mutated1</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/mutate.html'>mutate</a></span><span class='op'>(</span><span class='va'>iris</span>, Greater.Half <span class='op'>=</span> <span class='va'>Sepal.Width</span> <span class='op'>&gt;</span> <span class='fl'>0.5</span> <span class='op'>*</span> <span class='va'>Sepal.Length</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>tail</a></span><span class='op'>(</span><span class='va'>mutated1</span><span class='op'>)</span>
</code></pre></div>

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
145          6.7         3.3          5.7         2.5 virginica
146          6.7         3.0          5.2         2.3 virginica
147          6.3         2.5          5.0         1.9 virginica
148          6.5         3.0          5.2         2.0 virginica
149          6.2         3.4          5.4         2.3 virginica
150          5.9         3.0          5.1         1.8 virginica
    Greater.Half
145        FALSE
146        FALSE
147        FALSE
148        FALSE
149         TRUE
150         TRUE
```

</div>


To check how many flower satisfy this condition, the output of the function `table{base}` is a contingency table with the no. of individual (`FALSE` and `TRUE`):

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/table.html'>table</a></span><span class='op'>(</span><span class='va'>mutated1</span><span class='op'>$</span><span class='va'>Greater.Half</span><span class='op'>)</span>
</code></pre></div>

```

FALSE  TRUE 
   84    66 
```

</div>


## `arrange`

It is used to sort rows by variables in both an ascending and descending order. For example:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># Sepal Width by ascending order</span>
<span class='va'>arranged</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/arrange.html'>arrange</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='va'>Sepal.Width</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>arranged</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
1          5.0         2.0          3.5         1.0 versicolor
2          6.0         2.2          4.0         1.0 versicolor
3          6.2         2.2          4.5         1.5 versicolor
4          6.0         2.2          5.0         1.5  virginica
5          4.5         2.3          1.3         0.3     setosa
6          5.5         2.3          4.0         1.3 versicolor
```

<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># Sepal Width by descending order</span>
<span class='va'>arranged1</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/arrange.html'>arrange</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='fu'><a href='https://dplyr.tidyverse.org/reference/desc.html'>desc</a></span><span class='op'>(</span><span class='va'>Sepal.Width</span><span class='op'>)</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>arranged1</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.7         4.4          1.5         0.4  setosa
2          5.5         4.2          1.4         0.2  setosa
3          5.2         4.1          1.5         0.1  setosa
4          5.8         4.0          1.2         0.2  setosa
5          5.4         3.9          1.7         0.4  setosa
6          5.4         3.9          1.3         0.4  setosa
```

</div>


## `group_by`

It is done to group observations within a dataset by one or more variables. Data operations are often performed on groups defined by variables. For example when combined:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># Mean sepal width by Species</span>
<span class='va'>gp</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/group_by.html'>group_by</a></span><span class='op'>(</span><span class='va'>iris</span>, <span class='va'>Species</span><span class='op'>)</span>
<span class='va'>gp.mean</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/summarise.html'>summarise</a></span><span class='op'>(</span><span class='va'>gp</span>,Mean.Sepal <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='op'>(</span><span class='va'>Sepal.Width</span><span class='op'>)</span><span class='op'>)</span>
<span class='va'>gp.mean</span>
</code></pre></div>

```
# A tibble: 3 x 2
  Species    Mean.Sepal
  <fct>           <dbl>
1 setosa           3.43
2 versicolor       2.77
3 virginica        2.97
```

</div>


Visit the follwoing [website](https://dplyr.tidyverse.org/) for more information on the `dplyr` package

# Pipe operator

The pipe operator `%>%` allows to wrap multiple functions together. It can be used with functions like `filter`, `select`, `arrange`, `summarise`, `group_by`, etc. As for  an example:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'>#To select the rows with conditions</span>
<span class='va'>iris</span> <span class='op'>%&gt;%</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/filter.html'>filter</a></span><span class='op'>(</span><span class='va'>Species</span> <span class='op'>==</span> <span class='st'>"setosa"</span>,<span class='va'>Sepal.Width</span> <span class='op'>&gt;</span> <span class='fl'>3.8</span><span class='op'>)</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.4         3.9          1.7         0.4  setosa
2          5.8         4.0          1.2         0.2  setosa
3          5.7         4.4          1.5         0.4  setosa
4          5.4         3.9          1.3         0.4  setosa
5          5.2         4.1          1.5         0.1  setosa
6          5.5         4.2          1.4         0.2  setosa
```

</div>


To find mean `Sepal`Length by `Species`, we use teh pipe operator as following:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>iris</span>  <span class='op'>%&gt;%</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/group_by.html'>group_by</a></span><span class='op'>(</span><span class='va'>Species</span><span class='op'>)</span> <span class='op'>%&gt;%</span> <span class='fu'><a href='https://dplyr.tidyverse.org/reference/summarise.html'>summarise</a></span><span class='op'>(</span>Mean.Length <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='op'>(</span><span class='va'>Sepal.Length</span><span class='op'>)</span><span class='op'>)</span>
</code></pre></div>

```
# A tibble: 3 x 2
  Species    Mean.Length
  <fct>            <dbl>
1 setosa            5.01
2 versicolor        5.94
3 virginica         6.59
```

</div>


```{.r .distill-force-highlighting-css}
```
