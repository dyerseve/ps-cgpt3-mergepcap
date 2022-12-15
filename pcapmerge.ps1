$input_folder = "D:\pcap"
$output_file = "D:\pcap\output\merged_pcap.pcap"

# Get a list of all PCAP files in the input folder
$pcap_files = Get-ChildItem -Path $input_folder -Filter "*.pcap"

# Build the mergecap command with the list of PCAP files
[string]$mergecap_command = "$Env:Programfiles\Wireshark\mergecap.exe"
[array]$mergecap_args = "-w", $output_file

foreach ($file in $pcap_files)
{
    $mergecap_args = $mergecap_args + $file.FullName
}

# Execute the mergecap command
#write-host $mergecap_command
#write-host $mergecap_args
& "$mergecap_command" $mergecap_args
