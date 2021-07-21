#include <cstdlib>
#include <iostream>
#include <bsoncxx/builder/stream/document.hpp>
#include <bsoncxx/json.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <mongocxx/uri.hpp>


using bsoncxx::builder::stream::close_document;
using bsoncxx::builder::stream::document;
using bsoncxx::builder::stream::finalize;
using bsoncxx::builder::stream::open_document;
mongocxx::instance instance{};// don't put inside main 

int main() {
    mongocxx::client conn{ mongocxx::uri{ "mongodb://localhost:27017" } };
    bsoncxx::builder::stream::document document{};
    document << "Data" << "hello";

    return 0;
}