# Introduction

*Developer documentation for the family of LCMAP clients*

[![][lcmap-logo]][lcmap-logo-large]

[lcmap-logo]: images/lcmap-logo-1-250px.png
[lcmap-logo-large]: images/lcmap-logo-1-1000px.png


[TBD]

<aside class="success">
The following API functions are ready to use:
<ul>
<li><code></code>, <code></code>, <code></code></li>
</ul>
</aside>

<aside class="caution">
Note that the following have not been tested extensively (or possibly at all)
against compliant servers:
<ul>
<li><code></code>, <code></code>, <code></code>, <code></code></li>
</ul>
</aside>

<aside class="danger">
Note that the following have not yet been implemented:
<ul>
<li>Functions for <code>CONNECT</code></li>
</ul>
</aside>

# Installation


> Just add it to your ``rebar.config`` deps:

```erlang
  {deps, [
    ...
    {lhc, ".*",
      {git, "git@github.com:lfex/lhc.git", "master"}}
      ]}.
```

> Then execute the usual ``rebar`` command:

```bash
    $ rebar compile
```

See notes to the right.
