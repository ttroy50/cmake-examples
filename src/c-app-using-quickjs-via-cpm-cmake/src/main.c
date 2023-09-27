#include <stdio.h>
#include <quickjs/quickjs.h>

int main() {
    JSRuntime *rt;
    JSContext *ctx;
    JSValue val;

    // Initialize QuickJS runtime and context
    rt = JS_NewRuntime();
    ctx = JS_NewContext(rt);

    // Evaluate the expression "1+2" using QuickJS
    JS_Eval(ctx, "1+2", 5, "<input>", JS_EVAL_TYPE_GLOBAL, &val);

    // Check if evaluation was successful
    if (JS_IsException(val)) {
        printf("Error during evaluation:\n");
        JSValueExoticPrint(ctx, JS_GetException(ctx));
    } else {
        // Convert the result to a C double
        double result = JSValueToNumber(ctx, val, NULL);

        // Print the result
        printf("Result: %.2f\n", result);

        // Free the result
        JS_FreeValue(ctx, val);
    }

    // Cleanup and release resources
    JS_FreeContext(ctx);
    JS_FreeRuntime(rt);

    return 0;
}
