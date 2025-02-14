{ lib, buildDunePackage, fetchFromGitLab
, ff-sig, zarith, zarith_stubs_js, integers_stubs_js, integers, hex
, alcotest, ff-pbt }:

buildDunePackage rec {
  pname = "bls12-381";
  version = "4.0.0";
  src = fetchFromGitLab {
    owner = "dannywillems";
    repo = "ocaml-bls12-381";
    rev = version;
    sha256 = "sha256-K9AsYUAUdk4XnspUalJKX5kycDFwO8PZx4bGaD3qZv8=";
  };

  minimalOCamlVersion = "4.08";

  propagatedBuildInputs = [
    ff-sig
    zarith
    zarith_stubs_js
    integers_stubs_js
    integers
    hex
  ];

  checkInputs = [ alcotest ff-pbt ];

  doCheck = true;

  meta = {
    homepage = "https://gitlab.com/dannywillems/ocaml-bls12-381";
    description = "OCaml binding for bls12-381 from librustzcash";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.ulrikstrid ];
  };
}
