#include <iostream>
#include <arrow/api.h>
#include <arrow/result.h>

arrow::Status RunMain()
{
    arrow::Int8Builder int8builder;
    int8_t days_raw[5] = {1, 12, 17, 23, 28};
    ARROW_RETURN_NOT_OK(int8builder.AppendValues(days_raw, 5));

    std::shared_ptr<arrow::Array> days;
    ARROW_ASSIGN_OR_RAISE(days, int8builder.Finish());

    return arrow::Status::OK();
}

int main()
{
    arrow::Status st = RunMain();
    if (!st.ok())
    {
        std::cerr << st.ToString() << std::endl;
        return 1;
    }
    printf("hello");
    return 0;
}
