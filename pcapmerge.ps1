$input_folder = "C:\pcap_files"
$output_file = "C:\merged_pcap.pcap"

# Get a list of all PCAP files in the input folder
$pcap_files = Get-ChildItem -Path $input_folder -Filter "*.pcap"

# Build the mergecap command with the list of PCAP files
$mergecap_command = "mergecap.exe -w $output_file"
foreach ($file in $pcap_files)
{
    $mergecap_command = $mergecap_command + " " + $file.FullName
}

# Execute the mergecap command
Invoke-Expression $mergecap_command
