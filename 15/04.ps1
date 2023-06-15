$input = “dABlAHgAdAAgAHQAbwAgAGIAZQAgAGUAbgBjAG8AZABlAGQA”
$output = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($input))
$output
