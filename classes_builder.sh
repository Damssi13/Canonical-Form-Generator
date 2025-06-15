#!/bin/bash


if [ -z "$1" ]; then
    echo "Usage: ./create_class.sh ClassName"
    exit 1
fi

NAME="$1"
HEADER_FILE="${NAME}.hpp"
SOURCE_FILE="${NAME}.cpp"
INCLUDE_GUARD="$(echo "$NAME" | tr '[:lower:]' '[:upper:]')_HPP"

cat > "$HEADER_FILE" <<EOF
#ifndef ${INCLUDE_GUARD}
#define ${INCLUDE_GUARD}

class ${NAME} {
public:
    ${NAME}();
    ${NAME}(const ${NAME}& other);
    ${NAME}& operator= (const ${NAME}& other);
    ~${NAME}();

private:

};

#endif
EOF

cat > "$SOURCE_FILE" <<EOF
#include "${HEADER_FILE}"

${NAME}::${NAME}() {
    // Constructor
}

${NAME}::${NAME}(const ${NAME}& other){
    //Copy
}

${NAME}& ${NAME}::operator=(const ${NAME}& other){
    //operator
}

${NAME}::~${NAME}() {
    // Destructor
}
EOF

echo "Created ${HEADER_FILE} and ${SOURCE_FILE}"