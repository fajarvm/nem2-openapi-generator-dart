# nem2-openapi-generator-dart
This is an OpenAPI generator for Dart (v2 and above) which allows generation of Symbol API client libraries for NEM2 SDK Dart ([nem2-sdk-dart][nem2-sdk-dart-repo]) automatically given a Symbol OpenAPI Spec ([symbol-openapi][symbol-openapi-spec-repo]).

## Requirements
An [OpenAPI Generator CLI][openapi-generator-cli-docs] version 4.2.3 (or above) for your Operating System is required to generate the client libraries.
The code generation script uses Homebrew by default and it will install the openapi-generator-cli when it has not been installed.

If you want to install and use the OpenAPI generator without using Homebrew, then you can disable the line inside the code generation script that checks and installs it.

## Usage
Run the code generation script:
```$bash
./generate.sh
```
Please note that the generator also generates ```.gitignore```, a README, Dart metadata (pubspec), Travis and other configuration files which will overwrite any existing files with the same name.

## Configuration
The OpenAPI generator accepts custom configuration available for Dart from the file `openapi-config.yaml`. Please refer to the following page for a complete list of config options: [dart][openapi-generator-dart2-configs] or [dart-dio][openapi-generator-dart2-dio-configs] (depends on your preference).

## Version
This project is updated for Symbol OpenAPI specification version [0.8.5][symbol-openapi-spec-file].

## Notes
* This project's version should be consistent with that of the Symbol OpenAPI specification (as specified inside `openapi3.yaml`). 
* Whenever there is a new version available for the Symbol OpenAPI specification, this project should be upgraded, regenerated and published to [Dart packages repository][dart-packages-repo].
* The generator currently uses a patched version of the specification (`openapi3-any-of-patch.yaml`) due to an ongoing bug of the `anyOf` which also affects the Dart generator. We will use the standard specification once the `anyOf` issue has been fixed.
* Due to an open issue to the OpenAPI generator for Dart version 2 ([dart2 template issue][openapi-generator-dart2-template-issue]), you may want to use a custom template provided inside the `dart2-template` directory instead of the [default][openapi-generator-dart2-default-template] one. You can change the generator script to use this custom template when generating the code.

## TODOs
* Complete the whole dev process.
* Add Travis integration.
* Publish to Dart packages repository. 

## License
Copyright (c) 2020

Licensed under the [Apache License 2.0](LICENSE)

## Disclaimer
THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS, COPYRIGHT HOLDERS, REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL CLAIM, DAMAGES OR OTHER LIABILITY (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN ACTION OF CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[nem2-sdk-dart-repo]: https://github.com/fajarvm/nem2-sdk-dart
[symbol-openapi-spec-repo]: https://github.com/nemtech/symbol-openapi/
[symbol-openapi-spec-file]: https://github.com/nemtech/symbol-openapi/releases/tag/v0.8.5
[openapi-generator-cli-docs]: https://openapi-generator.tech/docs/installation
[openapi-generator-anyof-issue634]: https://github.com/OpenAPITools/openapi-generator/issues/634
[openapi-generator-dart2-template-issue]: https://github.com/OpenAPITools/openapi-generator/pull/3656
[openapi-generator-dart2-default-template]: https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources/dart2
[openapi-generator-dart2-configs]: https://openapi-generator.tech/docs/generators/dart
[openapi-generator-dart2-dio-configs]: https://openapi-generator.tech/docs/generators/dart-dio
[dart-packages-repo]: https://pub.dev
