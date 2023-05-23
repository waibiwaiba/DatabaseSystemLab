使用DBeaver连接mysql8.0.32时报错：Public Key Retrieval is not allowed
解决：`mysql -u username -p --allowPublicKeyRetrieval=true`
如果你在使用DBeaver连接MySQL 8.0时出现“Public Key Retrieval is not allowed”错误，这是由于MySQL 8.0默认禁止使用旧的身份验证插件所致。为了解决这个问题，你可以按照以下步骤操作：

打开DBeaver，并在连接配置中选择“高级”选项卡。

在“高级”选项卡中，找到“高级JDBC属性”设置，并单击“添加”。

在“添加属性”对话框中，输入以下属性名称和值：

属性名称：allowPublicKeyRetrieval
属性值：true
单击“确定”保存更改。
现在，你可以重新连接MySQL 8.0数据库，并且不应该再收到“Public Key Retrieval is not allowed”错误了。



### 实体

主键粗体，外键斜体

course(**course_num**, course_name, **teacher_num**)

- 课程-老师：n-1
- course_num->course_name

student(**student_num**, student_name, *class_num*, age, gender)

- 学生-班级：n-1
- student_num-> student_name, class_num, age, gender

score(**course_num**, **student_num**, grade)

- 课程-学生：m-n
- {course_num, student_num}->grade

teacher(**teacher_num**, teacher_name, *department_num*)

- 老师-系：n-1
- teacher_num->teacher_name, department_num

class(**class_num**, *department_num*)

- 班级-系：n-1
- class_num->department_num

dormitory(**dormitory_num**, *college_num*)

- 公寓-学院：n-1
- dormitory_num->college_num

laboratory(**laboratory_num**, laboratory_name, *college_num*)

- 实验室-学院：1-1
- laboratory_num->laboratory_name, college_num

college(**college_num**, college_name)

- college_num->college_name

department(**department_num**, department_name, *college_num*)

- 系-学院：n-1
- department_num->department_name, college_num