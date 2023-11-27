CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ ! -e student-submission/ListExamples.java ]]
then 
    echo 'Incorrect submission.'
fi

cp -r lib grading-area
tests=`find student-submission/*.java`
cp $tests grading-area
cp TestListExamples.java grading-area


cd grading-area

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples



# if [[ $output == $expected]]
# then 
# echo "TESTS PASSED!"

# else
# echo "TESTS FAILED!"
# echo "expected: $expected, actual: $output"
# fi


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
