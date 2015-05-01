# Static Driver

A dynamic web application for powering the dynamic features of static web sites.

## Background

Most modern web sites are dynamic.  When you request a URL, a web server passes your request to a
web application that queries a database and dynamically generates a web page and then sends it to
you.

That takes precious time, and it costs a lot of money because you have to provide enough server
power to handle all of your web requests.  It introduces downtime risk, because your server might
get overloaded from too much traffic.  Or somebody might exploit vulnerabilities in the dynamic
web application to breach your security and steal your data.

Why assume that risk?  Most web sites don't really need to be powered by dynamic web applications.
Most web sites can be structured so that the web pages have already been generated long before any
web visitor requests them.  If your web site is a static collection of web pages and asset files,
then you can host it very cheaply on a system like Amazon S3.  Your pages will be served to visitors
much more quickly than if they had to be dynamically generated before being served.  Your site will
be far cheaper to host.  It will not be at any risk of downtime from server overload.  And there
will be no web server or web application for hackers to attack.

So then why are most sites dynamic?  It's because most web sites have a small handful of features
that require a dynamic back end.  For example, if your site has a "contact" web form, then you need
some dynamic web app to handle those form submissions.  And you might need a web-based admin
system for managing content.

This app is for powering those few dynamic features in a web site, so that the rest of the site can
be static.