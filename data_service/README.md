# NWPC Data Service

A service for data files produced by operation systems running by NWPC.

## Build

Build from source code.

Use `Makefile` in project root directory to build `nwpc_data_server` in Linux.

## Server

Start the data server on port 33483:

```
nwpc_data_server serve --address ":33483" --config-dir=some/config/dir
```

## Client

Use `nwpc_data_client service` to connect to `nwpc_data_server`.

Use `--action` to specify remote action. There are three actions.

### findDataPath

Get data path on server.

```bash
nwpc_data_client service --address=data-service-address \
    --action findDataPath \
    --data-type=some/data/type \
    start_time forecast_time
```

Output is same as `nwpc_data_client hpc` command.

### getDataFileInfo

Get data file information on server.

```bash
nwpc_data_client service --address=data-service-address \
    --action getDataFileInfo \
    --data-type=some/data/type \
    --start-time=start_time \
    --forecast-time=forecast_time
```

When data file is found, two lines are printed: one for data file path and the other for data file size.

```
/g2/nwp/OPER_ARCH_TEST/nwp/GRAPES_GFS/GMF_GRAPES_GFS/Prod-grib/2019061621/ORIG/gmf.gra.2019061700000.grb2
303997137
```

When data file is not found or there is some error, error message is printed stderr. Such as

```
check file error: stat NOTFOUND: no such file or directory
```

### downloadDataFile

Download data file from server.

```bash
nwpc_data_client service --address=data-service-address \
    --action downloadDataFile \
    --output-dir=outout/dir \
    --data-type=some/data/type \
    --start-time=start_time \
    --forecast-time=forecast_time
```

Data file is saved on output dir with original file name on remote server.

## Develop

### Prepare

Prepare build environment.

Download and build gPRC library. 

Get gRPC plugin for golang.

The following commands can be used in Windows.

```cmd
go get -u google.golang.org/grpc
go get -u github.com/golang/protobuf/protoc-gen-go
set PATH=%PATH%;%GOPATH%/bin
```

### Upgrade gRPC codes

Run the following codes to re-generate gRPC codes after change `data_service.proto`.

```cmd
cd data_service
protoc.exe ^
    -I data_service ^
    data_service/data_service.proto ^
    --go_out=plugins=grpc:.
```

## License

Copyright &copy; 2019 Perilla Roc at nwpc-oper.

`nwpc-data-service` is licensed under [The MIT License](https://opensource.org/licenses/MIT).