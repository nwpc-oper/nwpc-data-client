#!/usr/bin/env bats

check_date=$(date -d "-1 day" +%Y%m%d)
year=$(echo ${check_date} | cut -b1-4)
month=$(echo ${check_date} | cut -b5-6)
day=$(echo ${check_date} | cut -b7-8)

hour=00
check_date_time=${check_date}${hour}

# postvar

@test "test grapes_meso_3km/bin/postvar runtime" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=runtime \
        --data-type=grapes_meso_3km/bin/postvar \
        "${check_date_time}" 3h)
  expected_result="/g2/nwp_qu/NWP_RMFS_DATA/grapes_meso_3km/cold/${hour}/fcst/grapes_model/run/postvar${check_date_time}00300"
  [ "x${result}" = "x${expected_result}" ]
}

@test "test grapes_meso_3km/bin/postvar runtime/archive" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=runtime/archive \
        --data-type=grapes_meso_3km/bin/postvar \
        "${check_date_time}" 3h)
  expected_result="/g2/nwp_qu/NWP_RMFS_DATA/grapes_meso_3km/DATABAK/cold/${check_date_time}/postvar${check_date_time}00300"
  [ "x${result}" = "x${expected_result}" ]
}

@test "test grapes_meso_3km/bin/postvar archive" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=archive \
        --data-type=grapes_meso_3km/bin/postvar \
        "${check_date_time}" 3h)
  expected_result="/g1/COMMONDATA/OPER/NWPC/GRAPES_MESO_3KM/Fcst-main/${check_date_time}/postvar${check_date_time}00300"
  [ "x${result}" = "x${expected_result}" ]
}

# modelvar

@test "test grapes_meso_3km/bin/modelvar runtime" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=runtime \
        --data-type=grapes_meso_3km/bin/modelvar \
        "${check_date_time}" 3h)
  expected_result="/g2/nwp_qu/NWP_RMFS_DATA/grapes_meso_3km/cold/${hour}/fcst/grapes_model/run/modelvar${check_date_time}00300"
  [ "x${result}" = "x${expected_result}" ]
}

@test "test grapes_meso_3km/bin/modelvar runtime/archive" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=runtime/archive \
        --data-type=grapes_meso_3km/bin/modelvar \
        "${check_date_time}" 3h)
  expected_result="/g2/nwp_qu/NWP_RMFS_DATA/grapes_meso_3km/DATABAK/cold/${check_date_time}/modelvar${check_date_time}00300"
  [ "x${result}" = "x${expected_result}" ]
}

@test "test grapes_meso_3km/bin/modelvar archive" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=archive \
        --data-type=grapes_meso_3km/bin/modelvar \
        "${check_date_time}" 3h)
  expected_result="/g1/COMMONDATA/OPER/NWPC/GRAPES_MESO_3KM/Fcst-main/${check_date_time}/modelvar${check_date_time}00300"
  [ "x${result}" = "x${expected_result}" ]
}

# grib2 orig
@test "test grapes_meso_3km/grib2/orig runtime" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=runtime \
        --data-type=grapes_meso_3km/grib2/orig \
        "${check_date_time}" 3h)
  expected_result="/g2/nwp_pd/NWP_GRAPES_MESO_3KM_POST_DATA/${check_date_time}/togrib2/output/rmf.hgra.${check_date_time}003.grb2"
  [ "x${result}" = "x${expected_result}" ]
}

@test "test grapes_meso_3km/grib2/orig archive" {
  result=$(${NWPC_DATA_CLIENT_PROGRAM} local \
        --location-level=archive \
        --data-type=grapes_meso_3km/grib2/orig \
        "${check_date_time}" 3h)
  expected_result="/g1/COMMONDATA/OPER/NWPC/GRAPES_MESO_3KM/Prod-grib/${check_date_time}/ORIG/rmf.hgra.${check_date_time}003.grb2"
  [ "x${result}" = "x${expected_result}" ]
}


