# NumericalApproximation

This repository contains several projects focused on numerical approximation techniques, with both theoretical and practical applications. Each project is stored in its own folder and includes a PDF report along with relevant code written in **C++** and **MATLAB**.

## Overview

The repository includes projects that explore various numerical methods for approximation, such as interpolation, numerical integration, and data fitting. The projects provide both theoretical foundations and practical implementations. Each project folder contains:

- **A PDF report** explaining the theory, implementation details, and results.
- **C++ code** for implementing the numerical methods.
- **MATLAB code** for running simulations and visualizing results.
- **JPG images** (if available) for visualizing results directly, in case MATLAB is not preferred.
## Compiling and Running C++ Code

### Prerequisites

To compile and run the C++ code, you need a C++ compiler such as **g++** (GNU C++ compiler). If you are using a Linux or macOS environment, the terminal will likely already have **g++** installed. On Windows, you can install **MinGW** or use an IDE like **Code::Blocks** that supports C++ development.

### Compilation

To compile the C++ code, follow these steps:

1. **Navigate to the project folder** where the C++ code is located.
   Open your terminal and use the `cd` command to go to the project directory. For istance:
   ```bash
   cd /Documents/FitzHugh-Nagumo
   ```

2. **Compile the C++ code** using the following command:
   ```bash
   g++ -std=c++17 main.cpp funzioni/*.cpp -o program
   ```

   - `main.cpp`: The main program file that orchestrates the numerical method.
   - `funzioni/*.cpp`: Additional function files in the `funzioni` folder that contain the implementation of the numerical algorithms.
   - `-o program`: Specifies the output file name, which will be the executable named `program`.

   This will generate an executable file named `program`. You can now run this program in the terminal.

### Running the Program

Once compiled, you can run the program by executing the following command:

```bash
./program
```

The program will prompt you for:

- **The name of the input file**: This should be a text file containing the necessary parameters for the numerical approximation.
- **The number of steps** (if required): Depending on the method, you may need to specify the number of steps for the algorithm.

### Output

The program will produce an output file named **`file_di_output.txt`**. This text file will be saved in the **user's folder**. This output file contains the results of the numerical approximation.

You can later use this **`file_di_output.txt`** for further analysis in MATLAB.

## Using MATLAB for Analysis

If you prefer not to compile the C++ code, **pre-generated text files** containing the results of the numerical approximations are already included in the repository. These files can be used directly in MATLAB for analysis.

### MATLAB Analysis

To analyze the results in MATLAB:

1. **Open MATLAB** and navigate to the project folder.
2. **Load the corresponding text file** (e.g., `file_di_output.txt`) by running the appropriate script that processes the data.
3. **Run the MATLAB script** to generate the numerical analysis and any corresponding visualizations.

This method allows you to skip the C++ compilation step while still being able to view and analyze the numerical results.

## Visualizations and Graphs

In some cases, the output files also include **visual graphs** of the numerical approximation results. These may be included in the project folder as **JPG images**. If they are not present in the folder, they will be added in the future to provide additional visual insights into the analysis.


## Folder Structure

Each project folder follows a structure like this:

```
/NumericalApproximation
|-- /Project1
|   |-- relazione.pdf
|   |-- main.cpp
|   |-- /funzioni
|   |   |-- newton.cpp
|   |   |-- stampe.cpp
|   |-- graph1.jpg
```

- **main.cpp**: The main program file.
- **funzioni/**: Folder containing additional C++ functions for the numerical methods.
