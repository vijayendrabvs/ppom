package main

import (

"fmt"

"github.com/hyperledger/fabric/core/chaincode/shim"
"github.com/hyperledger/fabric/protos/peer"
)

type MyEchoAsset struct {

}

func (asset *MyEchoAsset) Init(stub shim.ChaincodeStubInterface) peer.Response {
	return shim.Success([]byte("{}"))
}

func (asset *MyEchoAsset) Invoke(stub shim.ChaincodeStubInterface) peer.Response {
	// Extract the function and args from the transaction proposal
	fn, args := stub.GetFunctionAndParameters()

	var response string
	var err error
	if fn == "echo" {
		response, err = asset.Echo(stub, args)
	} else if fn == "write" {
		err = asset.Write(stub, args)
	} else if fn == "read" {
		response, err = asset.Read(stub, args)
	} else {
	return shim.Error(fmt.Sprintf("Invalid operation specified: %s", fn))
	}
	if err != nil {
		return shim.Error(err.Error())
	}
		return shim.Success([]byte(response))
	}

func main() {
	if err := shim.Start(new(MyEchoAsset)); err != nil {
		fmt.Printf("Error starting MyEchoAsset chaincode: %s", err)
	}
}

func (asset *MyEchoAsset) Read(stub shim.ChaincodeStubInterface, args []string) (string, error) {
	// key is sent as arg.
	if len(args) < 1 {
			return "", fmt.Errorf("Insufficient arguments")
	}
	key := args[0]

	val, err := stub.GetState(key)
	if err != nil {
			fmt.Errorf("Failed to retrieve key, err: %s", err.Error())
			return "", err
	}

	fmt.Printf("Key %s read from block, value: %s", key, val)
	return string(val), err
}

func (asset *MyEchoAsset) Write(stub shim.ChaincodeStubInterface, args []string) (error) {
	// Assume that the args have a key and a value.
	if len(args) < 2 {
			return fmt.Errorf("Insufficient arguments")
	}
	key := args[0]
	val := args[1]

	err := stub.PutState(key, []byte(val))
	if err != nil {
			fmt.Errorf("Failed to create key/val, err: %s", err.Error())
			return err
	}

	fmt.Printf("Key %s, val %s successfully written to block", key, val)
	return nil
}

func (asset *MyEchoAsset) Echo(stub shim.ChaincodeStubInterface, args []string) (string, error) {
	// Just return the first arg.
	if len(args) < 1 {
			return "", fmt.Errorf("Nothing to echo")
	}
	return args[0], nil
}
