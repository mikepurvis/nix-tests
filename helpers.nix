{ fetchFromGitHub, stdenvNoCC, coreutils }:
{
    pkgRepoSrc = src: { name, path, outputHash }:
        stdenvNoCC.mkDerivation {
            name = "${name}-src";
            inherit coreutils outputHash;
            builder = builtins.toFile "builder.sh" ''
                $coreutils/bin/cp -a $src/$path $out
            '';
            outputHashAlgo = "sha256";
            outputHashMode = "recursive";
        };
}
