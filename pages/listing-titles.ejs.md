<%
// Compact bilingual listing: just clickable post titles, no cards.
//
// Like listing-bilingual.ejs.md, a custom `template:` only receives `items`
// (already sorted + limited by Quarto core) and `utils`. We keep the `.list`
// wrapper that quarto-listing.js looks for, but render each item as a plain
// line instead of the full framed `.quarto-post` card.
//
// Titles localize: pick `title-en` when the active profile renders in English
// (item.lang starts with "en"), falling back to the canonical title.
%>

::: {.list .latest-posts}

<% items.forEach(function(item, index) { %>
<%
const en = item.lang && String(item.lang).startsWith("en");
const pick = (f) => (en && item[f + "-en"] !== undefined && item[f + "-en"] !== null) ? item[f + "-en"] : item[f];
const itemTitle = pick("title");
%>

```{=html}
<div class="latest-post" data-index="<%= index %>"><a href="<%- item.path %>" class="no-external"><%= itemTitle %></a></div>
```

<% }); %>

:::
