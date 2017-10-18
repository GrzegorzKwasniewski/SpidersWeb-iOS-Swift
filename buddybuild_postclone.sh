# Install swiftlint if necessary
if ! which swiftlint >/dev/null; then
    brew install swiftlint
fi

# Run Swiftlint
echo "Here comes the output of Swiftlint"
cd project_folder
swiftlint
