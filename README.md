# Instance to Instance data transfer (Automation)

# Description

- This Python script is designed to copy folders, items including annotations if any from one Girder server to another. It leverages the Girder API to facilitate the transfer of data between two Girder instances.


# Prerequisites
Before using this script, ensure you have the following:
- __Python 3__
- [__Girder CLI__](https://girder.readthedocs.io/en/latest/python-client.html), Ensure it is installed and accessible in your environment.


# Setup
- Clone the repository:

```
git clone https://github.com/SarderLab/Instance-to-Instance-DSA-Data-Transfer.git
```


- Run the script using the following command:

```
python transfer.py --src-api 'Instance_URL' --dest-api 'Instance_URL' --src-user SOURCE_USERNAME --dest-user DESTINATION_USERNAME --src-password 'SOURCE_PASSWORD' --dest-password 'DESTINATION_PASSWORD' --src-path 'SOURCE_PATH' --dest-path 'DESTINATION_PATH' --replace

```

# Parameters
--src-api: Source Girder API url (through /api/v1).

--dest-api: Destination Girder API url (through /api/v1).

--src-user: Source Girder username.

--dest-user: Destination Girder username.

--src-password: Source Girder password.

--dest-password: Destination Girder password.

--src-path: Source resource path.

--dest-path: Destination resource path. If the last component is ".", it is taken from the last component of the source resource path.

--replace: Replace all annotations.

--substr: All items must contain this substring.

## NOTE
- You need to get source path and destination path  using GET/resource/{id}/path from [__DSA__](https://athena.rc.ufl.edu/api/v1#/resource/resource_path_id_path)

### Example:
--src-api 'https://athena.rc.ufl.edu/api/v1/'

--dest-api 'https://devathena.rc.ufl.edu/api/v1/'

--src_path : /user/nikhil/Public/transfer

--dest_path : /user/nikhil/Public

# Description of few Parameters
__replace:__


__Type:__ Action with store_true.

__Description:__ This argument is a flag, and when present in the command-line, it sets a boolean value to True. It is used to indicate whether all annotations should be replaced during the copying process.

__Use Case:__ Suppose you have a destination Girder server where you want to update or replace existing annotations for items. By including the --replace flag in the command-line, the script will delete all existing annotations for the destination items before copying the annotations from the source.

__substr:__

__Type:__ String.

__Description:__ This argument allows you to specify a substring. During the copying process, only items whose names contain this specified substring will be considered for copying. If this argument is not provided, all items will be considered.

__Use Case:__ Let's say you want to copy only a subset of items from the source to the destination based on a specific naming pattern. For example, you might want to copy only items whose names contain the substring "example." In this case, you would use the --substr "example" in the command-line.

### Only copy items containing the substring "example"

```
python girder_data_copy.py --src-api <source_api_url> --dest-api <destination_api_url> --replace --substr "example"
```

### Copy all items without replacing annotations

```
python girder_data_copy.py --src-api <source_api_url> --dest-api <destination_api_url> --src-path /user/source_user --dest-path /user/dest_user
```

# Important Note
- Ensure that you have the necessary permissions to access and download files from the specified instance folders.


