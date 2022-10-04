<?php

namespace SwooleCli;

abstract class Project
{
    public string $name;
    public string $homePage = '';
    public string $license = '';
    public string $prefix = '';
    public int $licenseType = self::LICENSE_SPEC;

    const LICENSE_SPEC = 0;
    const LICENSE_APACHE2 = 1;
    const LICENSE_BSD = 2;
    const LICENSE_GPL = 3;
    const LICENSE_LGPL = 4;
    const LICENSE_MIT = 5;
    const LICENSE_PHP = 6;

    function __construct(string $name)
    {
        $this->name = $name;
    }

    function withLicense(string $license, int $licenseType = self::LICENSE_SPEC): static
    {
        $this->license = $license;
        $this->licenseType = $licenseType;
        return $this;
    }

    function withHomePage(string $homePage): static
    {
        $this->homePage = $homePage;
        return $this;
    }
}

class Library extends Project
{
    public string $url;
    public string $configure = '';
    public string $file = '';
    public string $ldflags = '';
    public string $makeOptions = '';
    public string $makeInstallOptions = "";
    public string $pkgConfig = '';
    public string $pkgName = '';
    public string $prefix = '/usr/local';

    function withUrl(string $url): static
    {
        $this->url = $url;
        return $this;
    }

    function withPrefix(string $prefix): static
    {
        $this->prefix = $prefix;
        return $this;
    }

    function withFile(string $file): static
    {
        $this->file = $file;
        return $this;
    }

    function withConfigure(string $configure): static
    {
        $this->configure = $configure;
        return $this;
    }

    function withLdflags(string $ldflags): static
    {
        $this->ldflags = $ldflags;
        return $this;
    }

    function withMakeOptions(string $makeOptions): static
    {
        $this->makeOptions = $makeOptions;
        return $this;
    }

    function withMakeInstallOptions(string $makeInstallOptions): static
    {
        $this->makeInstallOptions = $makeInstallOptions;
        return $this;
    }

    function withPkgConfig(string $pkgConfig): static
    {
        $this->pkgConfig = $pkgConfig;
        return $this;
    }

    function withPkgName(string $pkgName): static
    {
        $this->pkgName = $pkgName;
        return $this;
    }
}

class Extension extends Project
{
    public string $url;
    public string $options = '';
    public string $peclVersion = '';
    public string $file = '';
    public string $path = '';

    function withOptions(string $options): static
    {
        $this->options = $options;
        return $this;
    }

    function withUrl(string $url): static
    {
        $this->url = $url;
        return $this;
    }

    function withPeclVersion(string $peclVersion): static
    {
        $this->peclVersion = $peclVersion;
        return $this;
    }
}

class Preprocessor
{
    protected array $libraryList = [];
    protected array $extensionList = [];
    protected string $rootDir;
    protected string $libraryDir;
    protected string $extensionDir;
    protected string $pkgConfigPath = '$PKG_CONFIG_PATH';
    protected string $phpSrcDir;
    protected string $dockerVersion = 'latest';
    protected string $swooleDir;
    protected string $workDir = '/work';
    protected string $extraLdflags = '';
    protected string $os = 'linux';
    protected int $maxJob = 8;
    protected bool $installLibrary = true;

    function __construct(string $rootPath)
    {
        $this->rootDir = $rootPath;
        $this->libraryDir = $rootPath . DIRECTORY_SEPARATOR.'pool'.DIRECTORY_SEPARATOR.'lib';
        $this->extensionDir = $rootPath . DIRECTORY_SEPARATOR.'pool'.DIRECTORY_SEPARATOR.'ext';
    }

    function setPhpSrcDir(string $phpSrcDir)
    {
        $this->phpSrcDir = $phpSrcDir;
    }

    function setDockerVersion(string $dockerVersion)
    {
        $this->dockerVersion = $dockerVersion;
    }

    function setSwooleDir(string $swooleDir)
    {
        $this->swooleDir = $swooleDir;
    }

    function setPrefix(string $prefix)
    {
        $this->prefix = $prefix;
    }

    function setWorkdir(string $workDir)
    {
        $this->workDir = $workDir;
    }

    function setExtraLdflags(string $flags)
    {
        $this->extraLdflags = $flags;
    }

    function donotInstallLibrary()
    {
        $this->installLibrary = false;
    }

    function setOs(string $os)
    {
        $this->os = $os;
    }

    function addLibrary(Library $lib)
    {
        if (empty($lib->file)) {
            $lib->file = basename($lib->url);
        }
        if (!is_file($this->libraryDir . DIRECTORY_SEPARATOR . $lib->file)) {
            $dist = $this->libraryDir.DIRECTORY_SEPARATOR.$lib->file;
            echo `wget {$lib->url} -O {$dist}`;
            echo $lib->file;
        } else {
            echo "[Library] file cached: " . $lib->file . PHP_EOL;
        }

        if (!empty($lib->pkgConfig)) {
            $this->pkgConfigPath = $lib->pkgConfig . ':' . $this->pkgConfigPath;
        }

        if (empty($lib->license)) {
            throw new \RuntimeException("require license");
        }

        $this->libraryList[] = $lib;
    }

    function addExtension(Extension $ext)
    {
        if ($ext->peclVersion) {
            if ($ext->peclVersion == 'latest') {
                throw new \RuntimeException("require pecl version");
            } else {
                $file = $ext->name . '-' . $ext->peclVersion . '.tgz';
            }

            $ext->file = $file;
            $ext->path = $this->extensionDir . DIRECTORY_SEPARATOR . $file;

            if (!is_file($ext->path)) {
                echo `wget https://pecl.php.net/get/{$ext->file} -O {$ext->path}`;
                echo $ext->file;
            } else {
                echo "[Extension] file cached: " . $ext->file . PHP_EOL;
            }

            $dst_dir = $this->rootDir.DIRECTORY_SEPARATOR."ext".DIRECTORY_SEPARATOR.$ext->name;
            if (!is_dir($dst_dir)) {
                //echo "tar --strip-components=1 -C $dst_dir -xf {$ext->path}";
                echo `mkdir -p $dst_dir`;
                //$cmd = "tar --strip-components=1 -C \"$dst_dir\" -xf \"$ext->path\"";
                $cmd = str_replace(DIRECTORY_SEPARATOR,"/","tar  --force-local --strip-components=1 -C \"$dst_dir\" -xf \"$ext->path\"");
                echo $cmd . PHP_EOL;
                echo $dst_dir . PHP_EOL;
                echo $ext->path . PHP_EOL;
                echo `{$cmd}`;
            }
        }

        $this->extensionList[] = $ext;
    }

    function gen()
    {
        ob_start();
        include __DIR__ . DIRECTORY_SEPARATOR.'make.php';
        file_put_contents($this->rootDir . DIRECTORY_SEPARATOR.'make.sh', ob_get_clean());

        ob_start();
        include __DIR__ . DIRECTORY_SEPARATOR.'license.php';
        file_put_contents($this->rootDir . DIRECTORY_SEPARATOR.'bin'.DIRECTORY_SEPARATOR.'LICENSE', ob_get_clean());
    }

    /**
     * make -j {$n}
     * @param int $n
     */
    function setMaxJob(int $n)
    {
        $this->maxJob = $n;
    }

    function info()
    {
        echo '==========================================================' . PHP_EOL;
        echo "Extension count: " . count($this->extensionList) . PHP_EOL;
        echo '==========================================================' . PHP_EOL;
        foreach ($this->extensionList as $item) {
            echo $item->name . PHP_EOL;
        }

        echo '==========================================================' . PHP_EOL;
        echo "Library count: " . count($this->libraryList) . PHP_EOL;
        echo '==========================================================' . PHP_EOL;
        foreach ($this->libraryList as $item) {
            echo "{$item->name}\n";
        }
    }
}
