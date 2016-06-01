# OTP Docker

This project contains a docker recipe for deploying an Ubuntu instance with OpenTripPlanner installed. Additionaly it contains configuration to deploy the container to AWS Elastic Beanstalk.


## Requirements

In order to use this repository, you need to have the `AWS CLI` and `EB CLI`
installed.
If you want to test the images locally, you also must install `docker`:

```
$ brew install awscli aws-elasticbeanstalk
```

## Deploy the container to AWS EB

Open up the directory `docker` in your favourite text editor and change
the following files according to your needs:

* `docker/Dockerfile`: Change the OTP download url if needed and adapt the
  changes to the version number of the downloaded file.
* `docker/run.sh` Change the version number of otp and also change the
  memory needed to run OTP for the region you want to deploy

You should now change your working directory to `./docker`:

```
$ cd docker
```

To deploy a new OTP instance either create a new `AWS EB Environment` or clone an existing
one first.
To see which environments are available, type `eb list`.

### Cloning an environment:
Select the desired environment to clone via `eb use <ENVIRONMENT-NAME>` and then
type `eb clone`.
You will be asked about the name, cname and other things about your new environment.
Finally the environment will be created.

### Create a new environment:
If you want to configure more things, create a new environment via `eb init` and
`eb create <ENVIRONMENT-NAME>`.

### Post creation checks:

After you either cloned or created a new environment, check that you are using
the correct one:

```
$ eb list # lists all environments, the one in use is prefixed with a *
$ eb use <ENVIRONMENT-NAME> # if you need to switch the environment
```

### Ready to deploy!

Now that your environment is set up, you can deploy your docker container running
OTP:

```
$ eb deploy --staged
```

The `--staged` option lets you upload a new application, without having to
commit your local changes to the git repository.

## Memory Monitoring:

The new environment automatically sends instance performance values to AWS
Cloudwatch (see the `.ebextensions` folder for more information on this).

What is left is to create an actual alarm for AWS Cloudwatch.

There are 3 small steps involved in this:

1. Get the instance id of your instance: The command `eb status -v` prints the instance id to your console. You can copy it.

2. Edit the file `alarm-skeleton.json`:
   You should probably rename the alarm, enter the instance id in the corresponding
   field and set the alarm action.

3. Create the alarm via your terminal: Now that the `alarm-skeleton.json` is prepared, you can create the alarm via

   ```
   aws cloudwatch put-metric-alarm --cli-input-json "$(less alarm-skeleton.json)"
   ```



