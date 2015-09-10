# StatusPage.io Notification Resource

A resource for sending StatusPage.io status.

## Source Configuration

* `url`: *Required.* StatusPage.io REST Endpoint.

## Behavior

### `check`: Not implemented.

### `in`: Not implemented.

### `out`: Update a StatusPage.io status.

Send a status to StatusPage.io, with the configured parameters.

#### Parameters

* `oauth`: *Required.* Your "Authorization: OAuth" header to be sent    

See Section "Update a component" @ https://doers.statuspage.io/api/v1/components/

* `page`: *Required.* 
* `component`: *Required.* 
* `status`: *Required.* 

## Deploy with BOSH

See [github_url] for a BOSH release and instructions for integrating this resource into your Concourse via BOSH.
