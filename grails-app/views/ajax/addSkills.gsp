<script>
    function addToSkillsList(newSkill) {
        $.post("${request.contextPath}/ajax/addUserSkill", {id: ${userInstance.id}, txtSkill:newSkill },
                function (data) {
                    $('#skillsDiv').fadeOut(200);
                    var html = '<ul>';
                    $.each(data.skillList, function (index, value) {
                        $('#skillsDiv').text(index + ': ' + value.name).fadeIn(200);
                        html += '<li><a href="${request.contextPath}/skill/show/' + value.id + '">' + value.name + '</a></li>';
                    });
                    html += '</ul>';
                    $('#skillsDiv').html(html).fadeIn(200);
                });
    }
    $(document).ready(function () {
        $("#txtSkill").focus().autocomplete({
            minLength:2,
            cache:false,
            source:"${createLink( action: 'ajaxSkillSearch')}",
            select:function (event, ui) {
                addToSkillsList(ui.item.value);
            }

        });

        $("#btnAddSkill").click(function () {
            addToSkillsList($("#txtSkill").val());
        });
//
    });
</script>
