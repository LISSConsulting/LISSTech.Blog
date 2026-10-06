# LISSTech.Blog

Professional technical blog covering real infrastructure investigations.

## Stack

- Hugo (container build pinned to 0.165.0)
- PaperMod theme, pinned submodule commit `d3768854d00ad003b0a8dbdba254ce9224377a01`
- Static output served by Nginx on Coolify

## Local development

```bash
git submodule update --init --recursive
hugo server --buildDrafts
```

## Build

```bash
hugo --minify --destination public/
```

## Deployment

The Coolify application `gaxffo2nmmt8nswkr8yj0ova` builds the repository's Dockerfile from `main`. GitHub pushes trigger automatic deployment; do not queue a duplicate manual deployment after a push.

The active public URL and Hugo `baseURL` are:

https://gaxffo2nmmt8nswkr8yj0ova.clfy-a.lissonline.com/

The previously configured `blog.mwisniowski.com` was unverified and did not resolve in the reported browser session. It is not an active site address. Before adopting any custom domain, establish ownership and DNS routing, configure HTTPS in Coolify, then update Hugo `baseURL` and verify navigation, canonical links, RSS, and sitemap on that domain.

HTML responses use `Cache-Control: no-cache` so browsers revalidate after a rollout. Pages cached under the former one-hour policy may need one hard refresh. Do not treat cached HTML as deployment-state evidence.

## Required content workflow

1. Prepare sanitized evidence. Keep original RCA/workbook files, customer hostnames, domains, and private logs outside the public repository.
2. Route ALL publishable copy through GhostWriter with the reviewed active language profile. This includes article bodies, titles, descriptions, excerpts, and About copy. GhostWriter is required, not optional.
3. Require the generation response to report the selected Sonnet model. `evaluate_text` is deterministic local style analysis; it does not call or verify a language model.
4. Check generated copy against source facts and distinguish observations, inferences, and recommendations. Do not invent biography, vendor confirmation, outage, or completed remediation.
5. Save strict UTF-8 Markdown without replacement glyphs or non-whitespace control characters. Build and inspect the rendered article and navigation in a browser.
6. Commit and push the reviewed content to `main`, then verify the automatic deployment's pages, metadata, RSS, and sitemap.
