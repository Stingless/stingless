/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
    "os/exec"
	"github.com/spf13/cobra"
    "os"
    "log"
)

// runCmd represents the run command
var runCmd = &cobra.Command{
	Use:   "run",
	Short: "Run the ebpf executable tool of your choice",
	Long: ``,
	Run: run,
}
func run(ccmd *cobra.Command, args []string) {
    program, _ := ccmd.Flags().GetString("program")
    //argss, _ := ccmd.Flags().GetString("args")
    pathing := "/opt/stingless/bcc/tools/"+program+".py"
    command := exec.Command("python3",pathing)
    command.Stdout = os.Stdout
    err := command.Run()
    if err != nil {
        log.Println(err)
    }
}
func init() {
	rootCmd.AddCommand(runCmd)
    runCmd.Flags().StringP("program", "p", "", "Select program to be run")
    runCmd.Flags().StringP("args", "a", "", "Add arguments necessary for the given program")
	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// runCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// runCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
