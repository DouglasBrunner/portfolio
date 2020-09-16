# Conditionally Compile D code using DUB

Add a configurations section to your dub.json file

Each section of D code has conditional compilation via versions.
https://dlang.org/spec/version.html

we conditionally compile the code for basic auth and ldap
version (LDAP) {}
version (BasicAuth) {}

the standard app will only have basic auth
"configurations": [
    {
        "name": "standardapp",
        "targetType": "executable",
        "platforms": ["windows"],
        "versions": ["BasicAuth"],
    },

the enterprise app will contain both BasicAuth and LDAP
"configurations": [
    {
        "name": "enterprise",
        "targetType": "executable",
        "platforms": ["windows"],
        "versions": ["BasicAuth", "LDAP"],
    },

https://dub.pm/package-format-json.html#configurations
