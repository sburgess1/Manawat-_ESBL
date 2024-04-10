def extract_contigs_from_plasmids(input_file):
    plasmid_contigs_list = {}
#Script to extract plasmid contigs. The presumptive plasmid contigs were identified using rfPlasmid.
#The first column of the plasmid contig list contains the name of the genome file and the second column contains the contigID

    # Read the input file and populate the plasmid_contigs_list dictionary
    with open(input_file, "r") as infile:
        for line in infile:
            genome_file, plasmid_contig = line.strip().split("\t")
            
            # Use the genome_file directly as the key, preserving the ".fasta" extension
            if genome_file not in plasmid_contigs_list:
                plasmid_contigs_list[genome_file] = []
                
            plasmid_contigs_list[genome_file].append(plasmid_contig)

    # Process each genome and extract the plasmid contigs
    for genome_file, plasmid_contigs in plasmid_contigs_list.items():
        genome_name = genome_file.rstrip(".fasta")
        print("Processing genome:", genome_name)  # Print genome_name here
        print("Genome file:", genome_file)  # Print genome_file here
        
        # Rest of the code for processing the genome
        with open(genome_file, "r") as input_handle:
            genome_records = SeqIO.parse(input_handle, "fasta")
            extracted_records = []

            for record in genome_records:
                if record.id in plasmid_contigs:
                    extracted_records.append(record)

        # Create the output_file name using genome_file directly
        output_file = f"{genome_file}_plasmid_contigs.fasta"
        with open(output_file, "w") as output_handle:
            SeqIO.write(extracted_records, output_handle, "fasta")
if __name__ == "__main__":
    input_file = "genome_plasmid_contig_list.txt"  # Replace with the name of your input file
    extract_contigs_from_plasmids(input_file)