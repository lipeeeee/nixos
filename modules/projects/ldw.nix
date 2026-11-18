{ pkgs, ... }:
let
  python = pkgs.python3.withPackages (ps:
    let
      django = ps.django_6_0;
      django-bootstrap5 = ps.buildPythonPackage rec {
        pname = "django-bootstrap5";
        version = "25.3";
        pyproject = true;
        src = pkgs.fetchPypi {
          pname = "django_bootstrap5";
          inherit version;
          hash = "sha256-zDbxoZ0yAMD1YoxwMyDttcTjnhm/F2B/rfWN2xGCiRI=";
        };
        build-system = [ ps.uv-build ];
        postPatch = ''
          substituteInPlace pyproject.toml --replace-fail "uv_build>=0.9.6,<0.10.0" uv_build
        '';
        dependencies = [ django ];
        pythonImportsCheck = [ "django_bootstrap5" ];
      };
      django-sass-processor = ps.buildPythonPackage rec {
        pname = "django-sass-processor";
        version = "1.4.2";
        pyproject = true;
        src = pkgs.fetchPypi {
          pname = "django_sass_processor";
          inherit version;
          hash = "sha256-WcECi1pb0BWKDqkqxdU45dietUfpEKReM02cezuBSxg=";
        };
        build-system = [ ps.setuptools ];
        dependencies = [ django ps.libsass ];
        pythonImportsCheck = [ "sass_processor" ];
      };
    in [ django ps.psycopg ps.debugpy ps.libsass django-sass-processor django-bootstrap5 ]);
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "ldw-python" ''exec ${python}/bin/python "$@"'')
    (pkgs.writeShellScriptBin "django-admin" ''exec ${python}/bin/django-admin "$@"'')
  ];
}
