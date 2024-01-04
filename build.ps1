$version=11.0.6
$packages=@('Avalonia')

mkdir -Force packages

foreach ($package in $packages)
{
	$dest="packages\$package"
	if (!(Test-Path($dest)))
	{
		Invoke-WebRequest https://www.nuget.org/api/v2/package/$package/$version -OutFile packages/$package.zip
		Expand-Archive -DestinationPath packages/$package packages/$package.zip
	}
}

docfx 