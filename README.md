# nem2-openapi-generator-dart
This is an OpenAPI generator for Dart (v2 and above) which allows generation of NEM2 API client libraries for NEM2 SDK Dart ([nem2-sdk-dart][nem2-sdk-dart-repo]) automatically given a NEM2 OpenAPI Spec ([nem2-openapi][nem2-openapi-spec-repo]).

## Requirements
An [OpenAPI Generator CLI][openapi-generator-cli-docs] for your Operating System is required to generate the client libraries.
The code generation script uses Homebrew by default and it will install the openapi-generator-cli when it has not been installed.

If you want to install and use the OpenAPI generator without using Homebrew, then you can disable the line inside the code generation script that checks and installs it.

## Usage
Run the code generation script:
```$bash
./generate.sh
```

## Configuration
The OpenAPI generator uses a custom configuration file `openapi-config.yaml` available for Dart. Please refer to the following page for a complete list of config options: [here][openapi-genrator-dart2-configs].

## Version
This project is updated for NEM2 OpenAPI specification version [0.7.20][nem2-openapi-spec-file].

## Notes
* This project's version should be consistent with that of the NEM2 OpenAPI specification (as specified inside `openapi3.yaml`). 
* Whenever there is a new version available for the NEM2 OpenAPI specification, this project should be upgraded, regenerated and published to [Dart packages repository][dart-packages-repo].
* The generator currently uses a patched version of the specification (`openapi3-anyOf-fix.yaml`) due to an ongoing bug of the `anyOf` which also affects the Dart generator. We will use the standard specification once the `anyOf` issue has been fixed.
* Due to an open issue to the OpenAPI generator for Dart version 2 ([dart2 template issue][openapi-generator-dart2-template-issue]), you may want to use a custom template provided inside the `dart2-template` directory instead of the [default][openapi-generator-dart2-default-template] one. You can change the generator script to use this custom template when generating the code.

## TODOs
* Complete the whole dev process.
* Add Travis integration.
* Publish to Dart packages repository. 

## License
Copyright (c) 2019

Licensed under the [Apache License 2.0](LICENSE)

## Disclaimer
THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS, COPYRIGHT HOLDERS, REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL CLAIM, DAMAGES OR OTHER LIABILITY (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN ACTION OF CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[nem2-sdk-dart-repo]: https://github.com/fajarvm/nem2-sdk-dart
[nem2-openapi-spec-repo]: https://github.com/nemtech/nem2-openapi/tree/master/spec
[nem2-openapi-spec-file]: https://github.com/nemtech/nem2-openapi/blob/master/spec/openapi3.yaml
[openapi-generator-cli-docs]: https://openapi-generator.tech/docs/installation
[openapi-generator-anyof-issue634]: https://github.com/OpenAPITools/openapi-generator/issues/634
[openapi-generator-dart2-template-issue]: https://github.com/OpenAPITools/openapi-generator/pull/3656
[openapi-generator-dart2-default-template]: https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources/dart2
[openapi-genrator-dart2-configs]: https://openapi-generator.tech/docs/generators/dart
[dart-packages-repo]: https://pub.dev
