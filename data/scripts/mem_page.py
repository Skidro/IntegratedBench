from generic_page import *

class mem_page(File):
	""" A subclass of file-type objects which contain information regarding
	    the memory addresses a program accesses during its execution. The
	    information in this file shold be of the format reported by valgrind
	    lackey tool """

	# Define some global variables
	PAGE_OFFSET = 12

	def __init__(self, filename):
		# Invoke the super-class constructor method
		super(mem_page, self).__init__(filename)

		# Create output file-name based on the name of input file
		self.out_file = self.name + '.out'

		# Create an empty hash for storing access data
		self.data_hash = {}

		# Parse the file
		self.parse()

		# Call the print function to output parsed data
		self.print_data()

		return

	def parse(self):
		""" This is the primary function for parsing data in the input file """

		# Open and parse the file
		with open(self.name, 'r') as fdi:
			for line in fdi:
				# Discard initial lines
				if (line[0] == '='):
					pass
				else:
					# Extract useful data in the file
					words = [word for word in line.split(' ') if word != ' ' and word not in ('I', 'L', 'S')]

					# Extract memory addresses and accesses
					words = words[-1].split(',')

					try:
						address = int(words[0], 16)
						access  = int(words[1])
					except:
						raise ValueError, 'Unable to convert string : %s' % words

					# Convert address to page number
					address = address >> self.PAGE_OFFSET

					# Store accesses in data hash
					if address in self.data_hash.keys():
						self.data_hash[address] += access
					else:
						self.data_hash[address] = access

		return

	def print_data(self):
		""" This function outputs data to relevant stream """

		# Open the output file 
		fdo = open(self.out_file, 'w')

		# Output the data in the out-file
		for key in self.data_hash.keys():
			fdo.write('0x%.8x : %d\n' % (key, self.data_hash[key]))

		# Close the output file
		fdo.close()

		return

def main():
	""" This is the primary entry point into the script """

	# Parse the file
	mempages	= mem_page('../data_1/mempagesorig.dat')

	return

# Desginate main as the entry point
if __name__ == "__main__":
	# Call the main function
	main()
