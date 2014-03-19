---
Title: ./Config_system.web_authorization
layout: default
---

An example of this [<system.web>]({{site.url}}/Config_system.web "wikilink") section
is:

<div class="xml">
    <pre><code>
    <authorization>
      <allow users="username" roles="role1,role2" verbs="GET,POST" />
      <deny users="user1,user2" verbs="POST" />
    </authorization>
    </code></pre>

</div>
Both *users* and *roles* allow the use of a wildcard character:

-   **?**: matches unauthenticated users/roles.
-   **\***: matches all users/roles.

By default, all users are authorized (machine.config), so as long as
there is no *deny* match for an user, the request will proceed. Rules
set in higher level virtual directories take precedence over the ones in
the current directory.

### "users"

It should be either a wildcard or a comma-separated list of user names.

### "roles"

It should be either a wildcard or a comma-separated list of role names.

### "verbs"

Comma-separated list of HTTP verbs (GET, POST, HEAD).

<Category:ASP.NET>
