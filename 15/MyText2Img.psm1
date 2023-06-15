function MyText2Img {
[CmdletBinding()]
param (

[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[string]$Textpath,

[Parameter (Mandatory = $False)]
[string]$IMG
)

    if (!$IMG) {$IMG = "$Env:USERPROFILE\Desktop\hidentext.jpg"}

        $content = [IO.File]::ReadAllText($Textpath)
        Add-Type -AssemblyName System.Drawing
        $IMG = new-object System.Drawing.Bitmap 1920,1080 
        $font = new-object System.Drawing.Font Consolas,18 
        $brushBg = [System.Drawing.Brushes]::White 
        $brushFg = [System.Drawing.Brushes]::Black 
        $graphics = [System.Drawing.Graphics]::FromImage($IMG) 
        $graphics.FillRectangle($brushBg,0,0,$IMG.Width,$IMG.Height) 
        $graphics.DrawString($content,$font,$brushFg,500,100) 
        $graphics.Dispose() 
        $IMG.Save($IMG) 
}
