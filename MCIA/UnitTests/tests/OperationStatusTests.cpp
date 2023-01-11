#include <gtest/gtest.h>
#include <OperationStatus.h>


TEST(OperationStatusTests, CodeConstructor) {
	OperationStatus o(OperationStatus::Code::SUCCESS);
	EXPECT_EQ(o.GetCode(), OperationStatus::Code::SUCCESS);
}

TEST(OperationStatusTests, StringConstructor) {

}