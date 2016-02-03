mongo-automation-agent
==================

mongodb-automation is a docker image that allows you to deploy MongoDB instances using [MMS Automation service](https://mms.mongodb.com). The image provides a pre-installed and configured MMS Automation agent.

[See image in Docker Hub](https://registry.hub.docker.com/u/mcascallares/mongodb-automation/).


Examples
--------

### Running a single container

Launch a single mongodb-automation container where we are going to deploy one or more mongod instances:

    docker run -d \
        -p 27017:27017 \
        mcascallares/mongodb-automation:latest \
        --mmsBaseUrl=https://mms.mongodb.com \
        --mmsGroupId=<your_mms_group_id> \
        --mmsApiKey=<your_mms_api_key>


From the MMS interface configure MongoDB to deploy with the desired options.
