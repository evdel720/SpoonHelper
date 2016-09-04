export const CommentConstants = {
  CREATE_COMMENT: "CREATE_COMMENT",
  DESTROY_COMMENT: "DESTROY_COMMENT"
};

export const createComment = (comment, rId) => ({
  type: CommentConstants.CREATE_COMMENT,
  comment,
  rId
});

export const destroyComment = (commentId) => ({
  type: CommentConstants.DESTROY_COMMENT,
  commentId
});
