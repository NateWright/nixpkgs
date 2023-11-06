{ lib
, buildPythonPackage
, fetchPypi
, pyhcl
, requests
, poetry-core
, pythonOlder
}:

buildPythonPackage rec {
  pname = "hvac";
  version = "2.0.0";
  format = "pyproject";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-alHLmg0i/hPoJMsLChzi7qy5zmr2i30bZoniXsG+yvU=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    pyhcl
    requests
  ];

  # Requires running a Vault server
  doCheck = false;

  pythonImportsCheck = [
    "hvac"
  ];

  meta = with lib; {
    description = "HashiCorp Vault API client";
    homepage = "https://github.com/ianunruh/hvac";
    changelog = "https://github.com/hvac/hvac/blob/v${version}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}
