var domainDir = './lib/app/domain';
var presentationDir = './lib/app/presentation';
var sharedLibrariesDir = './lib/app/shared_libraries';

// Clean Architecture
var features = './lib/features';
// Data
String datasource(String value) => '$features/$value/data/datasources';
String localDatasource(String value) =>
    '$features/$value/data/datasources/local';
String remoteDatasource(String value) =>
    '$features/$value/data/datasources/remote';
String model(String value) => '$features/$value/data/models';
String bodyModel(String value) => '$features/$value/data/models/body';
String responseModel(String value) => '$features/$value/data/models/response';
String dataRepositories(String value) => '$features/$value/data/repositories';
String mapper(String value) => '$features/$value/data/mapper';
// Domain
String entities(String value) => '$features/$value/domain/entities';
String bodyEntities(String value) => '$features/$value/domain/entities/body';
String responseEntities(String value) =>
    '$features/$value/domain/entities/response';
String domainRepositories(String value) =>
    '$features/$value/domain/repositories';
String usecase(String value) => '$features/$value/domain/usecases';
// Presentation
String bloc(String value) => '$features/$value/presentation/bloc';
String ui(String value) => '$features/$value/presentation/ui';
// Shared Libraries
var sharedLibraries = './lib/shared_libraries';
