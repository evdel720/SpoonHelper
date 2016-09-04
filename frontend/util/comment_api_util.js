export const createComment = (comment, rId, success, error) => {
  $.ajax({
    url: `/api/comments.json`,
    type: "POST",
    data: { comment: comment, id: rId },
    success,
    error
  });
};

export const destroyComment = (commentId, success) => {
  $.ajax({
    url: `/api/comments/${commentId}.json`,
    type: "DELETE",
    success
  });
};
